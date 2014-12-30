-- needs todays compiler fixes, to allow underscores in constructor names.
-- need to start chrome with --allow-file-access-from-files to be able to load local files
-- Example 6: Keyboard, different tetures, ...
module Main where

import Control.Monad.Eff.WebGL
import Graphics.WebGL
import Graphics.WebGLTexture
import qualified Data.Matrix4 as M4
import qualified Data.Vector3 as V3
import Control.Monad.Eff.Alert
import qualified Data.TypedArray as T

import Control.Monad.Eff
import Control.Monad
import Control.Monad.ST
import Debug.Trace
import Data.Tuple
import Data.Date
import Data.Maybe
import Data.Array
import Math

fshaderSource :: String
fshaderSource =
"""
    precision mediump float;

    varying vec2 vTextureCoord;

    uniform sampler2D uSampler;

    void main(void) {
        gl_FragColor = texture2D(uSampler, vec2(vTextureCoord.s, vTextureCoord.t));
    }
"""

vshaderSource :: String
vshaderSource =
"""
    attribute vec3 aVertexPosition;
    attribute vec2 aTextureCoord;

    uniform mat4 uMVMatrix;
    uniform mat4 uPMatrix;

    varying vec2 vTextureCoord;


    void main(void) {
        gl_Position = uPMatrix * uMVMatrix * vec4(aVertexPosition, 1.0);
        vTextureCoord = aTextureCoord;
    }
"""

type State = {
                context :: WebGLContext,
                shaderProgram :: WebGLProg,

                aVertexPosition :: VecBind,
                aTextureCoord :: VecBind,
                uPMatrix :: MatBind,
                uMVMatrix :: MatBind,
                uSampler :: MatBind,

                cubeVertices :: Buffer T.Float32,
                textureCoords :: Buffer T.Float32,
                cubeVertexIndices :: Buffer T.Uint16,
                texture :: WebGLTex,

                lastTime :: Maybe Number,
                xRot :: Number,
                xSpeed :: Number,
                yRot :: Number,
                ySpeed :: Number,
                z :: Number,
                filterInd :: Number
              }

main :: Eff (trace :: Trace, alert :: Alert, now :: Now) Unit
main = do
--  let stupid = Mat3 "stupid"
  --
    runWebGL
      "glcanvas"
      (\s -> alert s)
        \ context -> do
          trace "WebGL started"
          withShaders fshaderSource
                      vshaderSource
                      [Vec3 "aVertexPosition", Vec2 "aTextureCoord"]
                      [Mat4 "uPMatrix", Mat4 "uMVMatrix", Mat2 "uSampler"]
                      (\s -> alert s)
                        \ shaderProgram [aVertexPosition, aTextureCoord] [uPMatrix,uMVMatrix,uSampler] -> do
            cubeVertices <- makeBufferSimple [
                              -- Front face
                              -1.0, -1.0,  1.0,
                               1.0, -1.0,  1.0,
                               1.0,  1.0,  1.0,
                              -1.0,  1.0,  1.0,

                              -- Back face
                              -1.0, -1.0, -1.0,
                              -1.0,  1.0, -1.0,
                               1.0,  1.0, -1.0,
                               1.0, -1.0, -1.0,

                              -- Top face
                              -1.0,  1.0, -1.0,
                              -1.0,  1.0,  1.0,
                               1.0,  1.0,  1.0,
                               1.0,  1.0, -1.0,

                              -- Bottom face
                              -1.0, -1.0, -1.0,
                               1.0, -1.0, -1.0,
                               1.0, -1.0,  1.0,
                              -1.0, -1.0,  1.0,

                              -- Right face
                               1.0, -1.0, -1.0,
                               1.0,  1.0, -1.0,
                               1.0,  1.0,  1.0,
                               1.0, -1.0,  1.0,

                              -- Left face
                              -1.0, -1.0, -1.0,
                              -1.0, -1.0,  1.0,
                              -1.0,  1.0,  1.0,
                              -1.0,  1.0, -1.0]

            textureCoords <- makeBufferSimple [
                              -- Front face
                              0.0, 0.0,
                              1.0, 0.0,
                              1.0, 1.0,
                              0.0, 1.0,

                              -- Back face
                              1.0, 0.0,
                              1.0, 1.0,
                              0.0, 1.0,
                              0.0, 0.0,

                              -- Top face
                              0.0, 1.0,
                              0.0, 0.0,
                              1.0, 0.0,
                              1.0, 1.0,

                              -- Bottom face
                              1.0, 1.0,
                              0.0, 1.0,
                              0.0, 0.0,
                              1.0, 0.0,

                              -- Right face
                              1.0, 0.0,
                              1.0, 1.0,
                              0.0, 1.0,
                              0.0, 0.0,

                              -- Left face
                              0.0, 0.0,
                              1.0, 0.0,
                              1.0, 1.0,
                              0.0, 1.0
                            ]
            cubeVertexIndices <- makeBuffer ELEMENT_ARRAY_BUFFER T.asUint16Array
                            [
                              0, 1, 2,      0, 2, 3,    -- Front face
                              4, 5, 6,      4, 6, 7,    -- Back face
                              8, 9, 10,     8, 10, 11,  -- Top face
                              12, 13, 14,   12, 14, 15, -- Bottom face
                              16, 17, 18,   16, 18, 19, -- Right face
                              20, 21, 22,   20, 22, 23  -- Left face
                            ]
            clearColor 0.0 0.0 0.0 1.0
            enable DEPTH_TEST
            textureFor "test.png" \texture -> do
              let state = {
                            context : context,
                            shaderProgram : shaderProgram,

                            aVertexPosition : aVertexPosition,
                            aTextureCoord : aTextureCoord,
                            uPMatrix : uPMatrix,
                            uMVMatrix : uMVMatrix,
                            uSampler : uSampler,

                            cubeVertices : cubeVertices,
                            textureCoords : textureCoords,
                            cubeVertexIndices : cubeVertexIndices,
                            texture : texture,
                            lastTime : Nothing,

                            xRot : 0,
                            xSpeed : 1.0,
                            yRot : 0,
                            ySpeed : 1.0,
                            z : (-5.0),
                            filterInd : 0
                          }
              runST  $ do
                stRef <- newSTRef state
                -- onKeyDown (handleKeyDown stRef)
                tick stRef

tick :: forall h eff. STRef h State ->  EffWebGL (st :: ST h, trace :: Trace, now :: Now |eff) Unit
tick stRef = do
  return unit
{-
--  trace ("tick: " ++ show s.lastTime)
  drawScene stRef
  animate stRef
  requestAnimationFrame (tick stRef)
-}

animate ::  forall h eff . STRef h State -> EffWebGL (st :: ST h, now :: Now |eff) Unit
animate stRef = do
  s <- readSTRef stRef
  timeNow <- liftM1 toEpochMilliseconds now
  case s.lastTime of
    Nothing -> writeSTRef stRef (s {lastTime = Just timeNow})
    Just lastt ->
      let elapsed = timeNow - lastt
      in writeSTRef stRef (s {lastTime = Just timeNow,
                              xRot = s.xRot + s.xSpeed * elapsed / 1000.0,
                              yRot = s.yRot + s.ySpeed * elapsed / 1000.0
                              })
  return unit


drawScene :: forall h eff . STRef h State -> EffWebGL (st :: ST h |eff) Unit
drawScene stRef = do
  s <- readSTRef stRef
  canvasWidth <- getCanvasWidth s.context
  canvasHeight <- getCanvasHeight s.context
  viewport 0 0 canvasWidth canvasHeight
  clear [COLOR_BUFFER_BIT, DEPTH_BUFFER_BIT]

  let pMatrix = M4.makePerspective 45 (canvasWidth / canvasHeight) 0.1 100.0
  setMatrix s.uPMatrix pMatrix

  let mvMatrix =
      M4.rotate (degToRad s.xRot) (V3.vec3' [1, 0, 0])
        $ M4.rotate (degToRad s.yRot) (V3.vec3' [0, 1, 0])
          $ M4.translate  (V3.vec3 0.0 0.0 s.z)
            $ M4.identity

  setMatrix s.uMVMatrix mvMatrix

  bindPointBuf s.cubeVertices s.aVertexPosition
  bindPointBuf s.textureCoords s.aTextureCoord

  activeTexture 0
  bindTexture TEXTURE_2D s.texture
  uniform1i s.uSampler.location 0

  bindBuf s.cubeVertexIndices
  drawElements TRIANGLES s.cubeVertexIndices.bufferSize
  return unit

-- | Convert from radians to degrees.
radToDeg :: Number -> Number
radToDeg x = x/pi*180

-- | Convert from degrees to radians.
degToRad :: Number -> Number
degToRad x = x/180*pi

foreign import data Event :: *

foreign import onKeyDown
"""
        function onKeyDown(handleKeyDown) {
          return function() {
            document.onkeydown = handleKeyDown;
            };}
""" ::  forall eff. (Event -> Eff (webgl :: WebGl | eff) Unit)
    -> Eff (webgl :: WebGl | eff) Unit

foreign import eventGetKeyCode
"""
  function eventGetKeyCode (event) {
      return (fromCharCode(event.keyCode));
      }
""" :: Event -> String

handleKeyDown :: forall h eff. STRef h State -> Event -> Eff (st :: ST h, trace :: Trace | eff) Unit
handleKeyDown stRef event =
  let key = eventGetKeyCode event
  in do
    trace ("Key pressed: " ++ key ++ "\n")
    return unit