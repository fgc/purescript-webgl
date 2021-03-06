# Module Documentation

## Module Control.Monad.Eff.WebGL

### Types

    type EffWebGL eff a = Eff (webgl :: WebGl | eff) a

    data WebGl :: !


### Values

    runWebGl_ :: forall a e. Eff (webgl :: WebGl | e) a -> Eff e a


## Module Graphics.Canvas.Extended

### Types

    data Image :: *


## Module Graphics.WebGL

### Types

    newtype Attribute typ where
      Attribute :: { aItemSize :: Number, aItemType :: Number, aName :: String, aLocation :: GLint } -> Attribute typ

    data Bool

    type Buffer a = { bufferSize :: Number, bufferType :: Number, webGLBuffer :: WebGLBuffer }

    data BufferTarget where
      ARRAY_BUFFER :: BufferTarget
      ELEMENT_ARRAY_BUFFER :: BufferTarget

    data Capacity where
      BLEND :: Capacity
      DEPTH_TEST :: Capacity
      CULL_FACE :: Capacity
      POLYGON_OFFSET_FILL :: Capacity
      SCISSOR_TEST :: Capacity

    data Mask where
      DEPTH_BUFFER_BIT :: Mask
      STENCIL_BUFFER_BIT :: Mask
      COLOR_BUFFER_BIT :: Mask

    data Mat2

    data Mat3

    data Mat4

    data Mode where
      POINTS :: Mode
      LINES :: Mode
      LINE_STRIP :: Mode
      LINE_LOOP :: Mode
      TRIANGLES :: Mode
      TRIANGLE_STRIP :: Mode
      TRIANGLE_FAN :: Mode

    data Sampler2D

    data Shaders bindings where
      Shaders :: String -> String -> Shaders bindings

    newtype Uniform typ where
      Uniform :: { uType :: Number, uName :: String, uLocation :: WebGLUniformLocation } -> Uniform typ

    data Vec2

    data Vec3

    data Vec4

    type WebGLContext = { canvasName :: String }

    newtype WebGLProg


### Values

    bindBuf :: forall a eff. Buffer a -> Eff (webgl :: WebGl | eff) Unit

    bindPointBuf :: forall a eff typ. Buffer a -> Attribute typ -> Eff (webgl :: WebGl | eff) Unit

    clear :: forall eff. [Mask] -> Eff (webgl :: WebGl | eff) Unit

    drawArr :: forall a eff typ. Mode -> Buffer a -> Attribute typ -> EffWebGL eff Unit

    drawElements :: forall a eff. Mode -> Number -> EffWebGL eff Unit

    enable :: forall eff. Capacity -> Eff (webgl :: WebGl | eff) Unit

    getCanvasHeight :: forall eff. WebGLContext -> Eff (webgl :: WebGl | eff) Number

    getCanvasWidth :: forall eff. WebGLContext -> Eff (webgl :: WebGl | eff) Number

    makeBuffer :: forall a eff. BufferTarget -> ([Number] -> T.ArrayBuffer a) -> [Number] -> Eff (webgl :: WebGl | eff) (Buffer a)

    makeBufferSimple :: forall eff. [Number] -> Eff (webgl :: WebGl | eff) (Buffer T.Float32)

    requestAnimationFrame :: forall a eff. Eff (webgl :: WebGl | eff) a -> Eff (webgl :: WebGl | eff) Unit

    runWebGL :: forall a eff. String -> (String -> Eff eff a) -> (WebGLContext -> EffWebGL eff a) -> Eff eff a

    setUniformBooleans :: forall eff typ. Uniform typ -> [Boolean] -> EffWebGL eff Unit

    setUniformFloats :: forall eff typ. Uniform typ -> [Number] -> EffWebGL eff Unit

    vertexPointer :: forall eff typ. Attribute typ -> EffWebGL eff Unit

    withShaders :: forall bindings eff a. Shaders (Object bindings) -> (String -> EffWebGL eff a) -> ({ webGLProgram :: WebGLProg | bindings } -> EffWebGL eff a) -> EffWebGL eff a


## Module Graphics.WebGLRaw

### Types

    data ArrayBufferView :: *

    type FloatArray = Float32Array

    type GLbitfield = Number

    type GLboolean = Boolean

    type GLbyte = Number

    type GLclampf = Number

    type GLenum = Number

    type GLfloat = Number

    type GLint = Number

    type GLintptr = Number

    type GLshort = Number

    type GLsizei = Number

    type GLsizeiptr = Number

    type GLubyte = Number

    type GLuint = Number

    type GLushort = Number

    data HTMLImageElement :: *

    data HTMLVideoElement :: *

    data ImageData :: *

    data WebGLActiveInfo :: *

    data WebGLBuffer :: *

    data WebGLContextAttributes :: *

    data WebGLFramebuffer :: *

    data WebGLProgram :: *

    data WebGLRenderbuffer :: *

    data WebGLShader :: *

    data WebGLTexture :: *

    data WebGLUniformLocation :: *


### Values

    _ACTIVE_ATTRIBUTES :: Number

    _ACTIVE_ATTRIBUTE_MAX_LENGTH :: Number

    _ACTIVE_TEXTURE :: Number

    _ACTIVE_UNIFORMS :: Number

    _ACTIVE_UNIFORM_MAX_LENGTH :: Number

    _ALIASED_LINE_WIDTH_RANGE :: Number

    _ALIASED_POINT_SIZE_RANGE :: Number

    _ALPHA :: Number

    _ALPHA_BITS :: Number

    _ALWAYS :: Number

    _ARRAY_BUFFER :: Number

    _ARRAY_BUFFER_BINDING :: Number

    _ATTACHED_SHADERS :: Number

    _BACK :: Number

    _BLEND :: Number

    _BLEND_COLOR :: Number

    _BLEND_DST_ALPHA :: Number

    _BLEND_DST_RGB :: Number

    _BLEND_EQUATION :: Number

    _BLEND_EQUATION_ALPHA :: Number

    _BLEND_EQUATION_RGB :: Number

    _BLEND_SRC_ALPHA :: Number

    _BLEND_SRC_RGB :: Number

    _BLUE_BITS :: Number

    _BOOL :: Number

    _BOOL_VEC2 :: Number

    _BOOL_VEC3 :: Number

    _BOOL_VEC4 :: Number

    _BROWSER_DEFAULT_WEBGL :: Number

    _BUFFER_SIZE :: Number

    _BUFFER_USAGE :: Number

    _BYTE :: Number

    _CCW :: Number

    _CLAMP_TO_EDGE :: Number

    _COLOR_ATTACHMENT0 :: Number

    _COLOR_BUFFER_BIT :: Number

    _COLOR_CLEAR_VALUE :: Number

    _COLOR_WRITEMASK :: Number

    _COMPILE_STATUS :: Number

    _COMPRESSED_TEXTURE_FORMATS :: Number

    _CONSTANT_ALPHA :: Number

    _CONSTANT_COLOR :: Number

    _CONTEXT_LOST_WEBGL :: Number

    _CULL_FACE :: Number

    _CULL_FACE_MODE :: Number

    _CURRENT_PROGRAM :: Number

    _CURRENT_VERTEX_ATTRIB :: Number

    _CW :: Number

    _DECR :: Number

    _DECR_WRAP :: Number

    _DELETE_STATUS :: Number

    _DEPTH_ATTACHMENT :: Number

    _DEPTH_BITS :: Number

    _DEPTH_BUFFER_BIT :: Number

    _DEPTH_CLEAR_VALUE :: Number

    _DEPTH_COMPONENT :: Number

    _DEPTH_COMPONENT16 :: Number

    _DEPTH_FUNC :: Number

    _DEPTH_RANGE :: Number

    _DEPTH_STENCIL :: Number

    _DEPTH_STENCIL_ATTACHMENT :: Number

    _DEPTH_TEST :: Number

    _DEPTH_WRITEMASK :: Number

    _DITHER :: Number

    _DONT_CARE :: Number

    _DST_ALPHA :: Number

    _DST_COLOR :: Number

    _DYNAMIC_DRAW :: Number

    _ELEMENT_ARRAY_BUFFER :: Number

    _ELEMENT_ARRAY_BUFFER_BINDING :: Number

    _EQUAL :: Number

    _FASTEST :: Number

    _FLOAT :: Number

    _FLOAT_MAT2 :: Number

    _FLOAT_MAT3 :: Number

    _FLOAT_MAT4 :: Number

    _FLOAT_VEC2 :: Number

    _FLOAT_VEC3 :: Number

    _FLOAT_VEC4 :: Number

    _FRAGMENT_SHADER :: Number

    _FRAMEBUFFER :: Number

    _FRAMEBUFFER_ATTACHMENT_OBJECT_NAME :: Number

    _FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE :: Number

    _FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE :: Number

    _FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL :: Number

    _FRAMEBUFFER_BINDING :: Number

    _FRAMEBUFFER_COMPLETE :: Number

    _FRAMEBUFFER_INCOMPLETE_ATTACHMENT :: Number

    _FRAMEBUFFER_INCOMPLETE_DIMENSIONS :: Number

    _FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT :: Number

    _FRAMEBUFFER_UNSUPPORTED :: Number

    _FRONT :: Number

    _FRONT_AND_BACK :: Number

    _FRONT_FACE :: Number

    _FUNC_ADD :: Number

    _FUNC_REVERSE_SUBTRACT :: Number

    _FUNC_SUBTRACT :: Number

    _GENERATE_MIPMAP_HINT :: Number

    _GEQUAL :: Number

    _GREATER :: Number

    _GREEN_BITS :: Number

    _HIGH_FLOAT :: Number

    _HIGH_INT :: Number

    _INCR :: Number

    _INCR_WRAP :: Number

    _INFO_LOG_LENGTH :: Number

    _INT :: Number

    _INT_VEC2 :: Number

    _INT_VEC3 :: Number

    _INT_VEC4 :: Number

    _INVALID_ENUM :: Number

    _INVALID_FRAMEBUFFER_OPERATION :: Number

    _INVALID_OPERATION :: Number

    _INVALID_VALUE :: Number

    _INVERT :: Number

    _KEEP :: Number

    _LEQUAL :: Number

    _LESS :: Number

    _LINEAR :: Number

    _LINEAR_MIPMAP_LINEAR :: Number

    _LINEAR_MIPMAP_NEAREST :: Number

    _LINES :: Number

    _LINE_LOOP :: Number

    _LINE_STRIP :: Number

    _LINE_WIDTH :: Number

    _LINK_STATUS :: Number

    _LOW_FLOAT :: Number

    _LOW_INT :: Number

    _LUMINANCE :: Number

    _LUMINANCE_ALPHA :: Number

    _MAX_COMBINED_TEXTURE_IMAGE_UNITS :: Number

    _MAX_CUBE_MAP_TEXTURE_SIZE :: Number

    _MAX_FRAGMENT_UNIFORM_VECTORS :: Number

    _MAX_RENDERBUFFER_SIZE :: Number

    _MAX_TEXTURE_IMAGE_UNITS :: Number

    _MAX_TEXTURE_SIZE :: Number

    _MAX_VARYING_VECTORS :: Number

    _MAX_VERTEX_ATTRIBS :: Number

    _MAX_VERTEX_TEXTURE_IMAGE_UNITS :: Number

    _MAX_VERTEX_UNIFORM_VECTORS :: Number

    _MAX_VIEWPORT_DIMS :: Number

    _MEDIUM_FLOAT :: Number

    _MEDIUM_INT :: Number

    _MIRRORED_REPEAT :: Number

    _NEAREST :: Number

    _NEAREST_MIPMAP_LINEAR :: Number

    _NEAREST_MIPMAP_NEAREST :: Number

    _NEVER :: Number

    _NICEST :: Number

    _NONE :: Number

    _NOTEQUAL :: Number

    _NO_ERROR :: Number

    _NUM_COMPRESSED_TEXTURE_FORMATS :: Number

    _ONE :: Number

    _ONE_MINUS_CONSTANT_ALPHA :: Number

    _ONE_MINUS_CONSTANT_COLOR :: Number

    _ONE_MINUS_DST_ALPHA :: Number

    _ONE_MINUS_DST_COLOR :: Number

    _ONE_MINUS_SRC_ALPHA :: Number

    _ONE_MINUS_SRC_COLOR :: Number

    _OUT_OF_MEMORY :: Number

    _PACK_ALIGNMENT :: Number

    _POINTS :: Number

    _POLYGON_OFFSET_FACTOR :: Number

    _POLYGON_OFFSET_FILL :: Number

    _POLYGON_OFFSET_UNITS :: Number

    _RED_BITS :: Number

    _RENDERBUFFER :: Number

    _RENDERBUFFER_ALPHA_SIZE :: Number

    _RENDERBUFFER_BINDING :: Number

    _RENDERBUFFER_BLUE_SIZE :: Number

    _RENDERBUFFER_DEPTH_SIZE :: Number

    _RENDERBUFFER_GREEN_SIZE :: Number

    _RENDERBUFFER_HEIGHT :: Number

    _RENDERBUFFER_INTERNAL_FORMAT :: Number

    _RENDERBUFFER_RED_SIZE :: Number

    _RENDERBUFFER_STENCIL_SIZE :: Number

    _RENDERBUFFER_WIDTH :: Number

    _RENDERER :: Number

    _REPEAT :: Number

    _REPLACE :: Number

    _RGB :: Number

    _RGB565 :: Number

    _RGB5_A1 :: Number

    _RGBA :: Number

    _RGBA4 :: Number

    _SAMPLER_2D :: Number

    _SAMPLER_CUBE :: Number

    _SAMPLES :: Number

    _SAMPLE_ALPHA_TO_COVERAGE :: Number

    _SAMPLE_BUFFERS :: Number

    _SAMPLE_COVERAGE :: Number

    _SAMPLE_COVERAGE_INVERT :: Number

    _SAMPLE_COVERAGE_VALUE :: Number

    _SCISSOR_BOX :: Number

    _SCISSOR_TEST :: Number

    _SHADER_SOURCE_LENGTH :: Number

    _SHADER_TYPE :: Number

    _SHADING_LANGUAGE_VERSION :: Number

    _SHORT :: Number

    _SRC_ALPHA :: Number

    _SRC_ALPHA_SATURATE :: Number

    _SRC_COLOR :: Number

    _STATIC_DRAW :: Number

    _STENCIL_ATTACHMENT :: Number

    _STENCIL_BACK_FAIL :: Number

    _STENCIL_BACK_FUNC :: Number

    _STENCIL_BACK_PASS_DEPTH_FAIL :: Number

    _STENCIL_BACK_PASS_DEPTH_PASS :: Number

    _STENCIL_BACK_REF :: Number

    _STENCIL_BACK_VALUE_MASK :: Number

    _STENCIL_BACK_WRITEMASK :: Number

    _STENCIL_BITS :: Number

    _STENCIL_BUFFER_BIT :: Number

    _STENCIL_CLEAR_VALUE :: Number

    _STENCIL_FAIL :: Number

    _STENCIL_FUNC :: Number

    _STENCIL_INDEX :: Number

    _STENCIL_INDEX8 :: Number

    _STENCIL_PASS_DEPTH_FAIL :: Number

    _STENCIL_PASS_DEPTH_PASS :: Number

    _STENCIL_REF :: Number

    _STENCIL_TEST :: Number

    _STENCIL_VALUE_MASK :: Number

    _STENCIL_WRITEMASK :: Number

    _STREAM_DRAW :: Number

    _SUBPIXEL_BITS :: Number

    _TEXTURE :: Number

    _TEXTURE0 :: Number

    _TEXTURE1 :: Number

    _TEXTURE10 :: Number

    _TEXTURE11 :: Number

    _TEXTURE12 :: Number

    _TEXTURE13 :: Number

    _TEXTURE14 :: Number

    _TEXTURE15 :: Number

    _TEXTURE16 :: Number

    _TEXTURE17 :: Number

    _TEXTURE18 :: Number

    _TEXTURE19 :: Number

    _TEXTURE2 :: Number

    _TEXTURE20 :: Number

    _TEXTURE21 :: Number

    _TEXTURE22 :: Number

    _TEXTURE23 :: Number

    _TEXTURE24 :: Number

    _TEXTURE25 :: Number

    _TEXTURE26 :: Number

    _TEXTURE27 :: Number

    _TEXTURE28 :: Number

    _TEXTURE29 :: Number

    _TEXTURE3 :: Number

    _TEXTURE30 :: Number

    _TEXTURE31 :: Number

    _TEXTURE4 :: Number

    _TEXTURE5 :: Number

    _TEXTURE6 :: Number

    _TEXTURE7 :: Number

    _TEXTURE8 :: Number

    _TEXTURE9 :: Number

    _TEXTURE_2D :: Number

    _TEXTURE_BINDING_2D :: Number

    _TEXTURE_BINDING_CUBE_MAP :: Number

    _TEXTURE_CUBE_MAP :: Number

    _TEXTURE_CUBE_MAP_NEGATIVE_X :: Number

    _TEXTURE_CUBE_MAP_NEGATIVE_Y :: Number

    _TEXTURE_CUBE_MAP_NEGATIVE_Z :: Number

    _TEXTURE_CUBE_MAP_POSITIVE_X :: Number

    _TEXTURE_CUBE_MAP_POSITIVE_Y :: Number

    _TEXTURE_CUBE_MAP_POSITIVE_Z :: Number

    _TEXTURE_MAG_FILTER :: Number

    _TEXTURE_MIN_FILTER :: Number

    _TEXTURE_WRAP_S :: Number

    _TEXTURE_WRAP_T :: Number

    _TRIANGLES :: Number

    _TRIANGLE_FAN :: Number

    _TRIANGLE_STRIP :: Number

    _UNPACK_ALIGNMENT :: Number

    _UNPACK_COLORSPACE_CONVERSION_WEBGL :: Number

    _UNPACK_FLIP_Y_WEBGL :: Number

    _UNPACK_PREMULTIPLY_ALPHA_WEBGL :: Number

    _UNSIGNED_BYTE :: Number

    _UNSIGNED_INT :: Number

    _UNSIGNED_SHORT :: Number

    _UNSIGNED_SHORT_4_4_4_4 :: Number

    _UNSIGNED_SHORT_5_5_5_1 :: Number

    _UNSIGNED_SHORT_5_6_5 :: Number

    _VALIDATE_STATUS :: Number

    _VENDOR :: Number

    _VERSION :: Number

    _VERTEX_ATTRIB_ARRAY_BUFFER_BINDING :: Number

    _VERTEX_ATTRIB_ARRAY_ENABLED :: Number

    _VERTEX_ATTRIB_ARRAY_NORMALIZED :: Number

    _VERTEX_ATTRIB_ARRAY_POINTER :: Number

    _VERTEX_ATTRIB_ARRAY_SIZE :: Number

    _VERTEX_ATTRIB_ARRAY_STRIDE :: Number

    _VERTEX_ATTRIB_ARRAY_TYPE :: Number

    _VERTEX_SHADER :: Number

    _VIEWPORT :: Number

    _ZERO :: Number

    activeTexture_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) Unit

    attachShader_ :: forall eff. WebGLProgram -> WebGLShader -> Eff (webgl :: WebGl | eff) Unit

    bindAttribLocation_ :: forall eff. WebGLProgram -> GLuint -> String -> Eff (webgl :: WebGl | eff) Unit

    bindBuffer_ :: forall eff. GLenum -> WebGLBuffer -> Eff (webgl :: WebGl | eff) Unit

    bindFramebuffer_ :: forall eff. GLenum -> WebGLFramebuffer -> Eff (webgl :: WebGl | eff) Unit

    bindRenderbuffer_ :: forall eff. GLenum -> WebGLRenderbuffer -> Eff (webgl :: WebGl | eff) Unit

    bindTexture_ :: forall eff. GLenum -> WebGLTexture -> Eff (webgl :: WebGl | eff) Unit

    blendColor_ :: forall eff. GLclampf -> GLclampf -> GLclampf -> GLclampf -> Eff (webgl :: WebGl | eff) Unit

    blendEquationSeparate_ :: forall eff. GLenum -> GLenum -> Eff (webgl :: WebGl | eff) Unit

    blendEquation_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) Unit

    blendFuncSeparate_ :: forall eff. GLenum -> GLenum -> GLenum -> GLenum -> Eff (webgl :: WebGl | eff) Unit

    blendFunc_ :: forall eff. GLenum -> GLenum -> Eff (webgl :: WebGl | eff) Unit

    bufferData_ :: forall eff. GLenum -> ArrayBuffer Float32 -> GLenum -> Eff (webgl :: WebGl | eff) Unit

    bufferSubData_ :: forall eff. GLenum -> GLintptr -> ArrayBuffer Float32 -> Eff (webgl :: WebGl | eff) Unit

    checkFramebufferStatus_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) GLenum

    clearColor_ :: forall eff. GLclampf -> GLclampf -> GLclampf -> GLclampf -> Eff (webgl :: WebGl | eff) Unit

    clearDepth_ :: forall eff. GLclampf -> Eff (webgl :: WebGl | eff) Unit

    clearStencil_ :: forall eff. GLint -> Eff (webgl :: WebGl | eff) Unit

    clear_ :: forall eff. GLbitfield -> Eff (webgl :: WebGl | eff) Unit

    colorMask_ :: forall eff. GLboolean -> GLboolean -> GLboolean -> GLboolean -> Eff (webgl :: WebGl | eff) Unit

    compileShader_ :: forall eff. WebGLShader -> Eff (webgl :: WebGl | eff) Unit

    copyTexImage2D_ :: forall eff. GLenum -> GLint -> GLenum -> GLint -> GLint -> GLsizei -> GLsizei -> GLint -> Eff (webgl :: WebGl | eff) Unit

    copyTexSubImage2D_ :: forall eff. GLenum -> GLint -> GLint -> GLint -> GLint -> GLint -> GLsizei -> GLsizei -> Eff (webgl :: WebGl | eff) Unit

    createBuffer_ :: forall eff. Eff (webgl :: WebGl | eff) WebGLBuffer

    createFramebuffer_ :: forall eff. Eff (webgl :: WebGl | eff) WebGLFramebuffer

    createProgram_ :: forall eff. Eff (webgl :: WebGl | eff) WebGLProgram

    createRenderbuffer_ :: forall eff. Eff (webgl :: WebGl | eff) WebGLRenderbuffer

    createShader_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) WebGLShader

    createTexture_ :: forall eff. Eff (webgl :: WebGl | eff) WebGLTexture

    cullFace_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) Unit

    deleteBuffer_ :: forall eff. WebGLBuffer -> Eff (webgl :: WebGl | eff) Unit

    deleteFramebuffer_ :: forall eff. WebGLFramebuffer -> Eff (webgl :: WebGl | eff) Unit

    deleteProgram_ :: forall eff. WebGLProgram -> Eff (webgl :: WebGl | eff) Unit

    deleteRenderbuffer_ :: forall eff. WebGLRenderbuffer -> Eff (webgl :: WebGl | eff) Unit

    deleteShader_ :: forall eff. WebGLShader -> Eff (webgl :: WebGl | eff) Unit

    deleteTexture_ :: forall eff. WebGLTexture -> Eff (webgl :: WebGl | eff) Unit

    depthFunc_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) Unit

    depthMask_ :: forall eff. GLboolean -> Eff (webgl :: WebGl | eff) Unit

    depthRange_ :: forall eff. GLclampf -> GLclampf -> Eff (webgl :: WebGl | eff) Unit

    detachShader_ :: forall eff. WebGLProgram -> WebGLShader -> Eff (webgl :: WebGl | eff) Unit

    disableVertexAttribArray_ :: forall eff. GLuint -> Eff (webgl :: WebGl | eff) Unit

    disable_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) Unit

    drawArrays_ :: forall eff. GLenum -> GLint -> GLsizei -> Eff (webgl :: WebGl | eff) Unit

    drawElements_ :: forall eff. GLenum -> GLsizei -> GLenum -> GLintptr -> Eff (webgl :: WebGl | eff) Unit

    enableVertexAttribArray_ :: forall eff. GLuint -> Eff (webgl :: WebGl | eff) Unit

    enable_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) Unit

    finish_ :: forall eff. Eff (webgl :: WebGl | eff) Unit

    flush_ :: forall eff. Eff (webgl :: WebGl | eff) Unit

    framebufferRenderbuffer_ :: forall eff. GLenum -> GLenum -> GLenum -> WebGLRenderbuffer -> Eff (webgl :: WebGl | eff) Unit

    framebufferTexture2D_ :: forall eff. GLenum -> GLenum -> GLenum -> WebGLTexture -> GLint -> Eff (webgl :: WebGl | eff) Unit

    frontFace_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) Unit

    generateMipmap_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) Unit

    getActiveAttrib_ :: forall eff. WebGLProgram -> GLuint -> Eff (webgl :: WebGl | eff) WebGLActiveInfo

    getActiveUniform_ :: forall eff. WebGLProgram -> GLuint -> Eff (webgl :: WebGl | eff) WebGLActiveInfo

    getAttachedShaders_ :: forall eff. WebGLProgram -> Eff (webgl :: WebGl | eff) WebGLShader

    getAttribLocation_ :: forall eff. WebGLProgram -> String -> Eff (webgl :: WebGl | eff) GLint

    getBufferParameter_ :: forall eff ret. GLenum -> GLenum -> Eff (webgl :: WebGl | eff) ret

    getContextAttributes_ :: forall eff. Eff (webgl :: WebGl | eff) WebGLContextAttributes

    getError_ :: forall eff. Eff (webgl :: WebGl | eff) GLenum

    getExtension_ :: forall eff ret. String -> Eff (webgl :: WebGl | eff) ret

    getFramebufferAttachmentParameter_ :: forall eff ret. GLenum -> GLenum -> GLenum -> Eff (webgl :: WebGl | eff) ret

    getParameter_ :: forall eff ret. GLenum -> Eff (webgl :: WebGl | eff) ret

    getProgramInfoLog_ :: forall eff. WebGLProgram -> Eff (webgl :: WebGl | eff) String

    getProgramParameter_ :: forall eff ret. WebGLProgram -> GLenum -> Eff (webgl :: WebGl | eff) ret

    getRenderbufferParameter_ :: forall eff ret. GLenum -> GLenum -> Eff (webgl :: WebGl | eff) ret

    getShaderInfoLog_ :: forall eff. WebGLShader -> Eff (webgl :: WebGl | eff) String

    getShaderParameter_ :: forall eff ret. WebGLShader -> GLenum -> Eff (webgl :: WebGl | eff) ret

    getShaderSource_ :: forall eff. WebGLShader -> Eff (webgl :: WebGl | eff) String

    getSupportedExtensions_ :: forall eff. Eff (webgl :: WebGl | eff) String

    getTexParameter_ :: forall eff ret. GLenum -> GLenum -> Eff (webgl :: WebGl | eff) ret

    getUniformLocation_ :: forall eff. WebGLProgram -> String -> Eff (webgl :: WebGl | eff) WebGLUniformLocation

    getUniform_ :: forall eff ret. WebGLProgram -> WebGLUniformLocation -> Eff (webgl :: WebGl | eff) ret

    getVertexAttribOffset_ :: forall eff. GLuint -> GLenum -> Eff (webgl :: WebGl | eff) GLsizeiptr

    getVertexAttrib_ :: forall eff ret. GLuint -> GLenum -> Eff (webgl :: WebGl | eff) ret

    hint_ :: forall eff. GLenum -> GLenum -> Eff (webgl :: WebGl | eff) Unit

    isBuffer_ :: forall eff. WebGLBuffer -> Eff (webgl :: WebGl | eff) GLboolean

    isContextLost_ :: forall eff. Eff (webgl :: WebGl | eff) Boolean

    isEnabled_ :: forall eff. GLenum -> Eff (webgl :: WebGl | eff) GLboolean

    isFramebuffer_ :: forall eff. WebGLFramebuffer -> Eff (webgl :: WebGl | eff) GLboolean

    isProgram_ :: forall eff. WebGLProgram -> Eff (webgl :: WebGl | eff) GLboolean

    isRenderbuffer_ :: forall eff. WebGLRenderbuffer -> Eff (webgl :: WebGl | eff) GLboolean

    isShader_ :: forall eff. WebGLShader -> Eff (webgl :: WebGl | eff) GLboolean

    isTexture_ :: forall eff. WebGLTexture -> Eff (webgl :: WebGl | eff) GLboolean

    lineWidth_ :: forall eff. GLfloat -> Eff (webgl :: WebGl | eff) Unit

    linkProgram_ :: forall eff. WebGLProgram -> Eff (webgl :: WebGl | eff) Unit

    pixelStorei_ :: forall eff. GLenum -> GLint -> Eff (webgl :: WebGl | eff) Unit

    polygonOffset_ :: forall eff. GLfloat -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    readPixels_ :: forall eff. GLint -> GLint -> GLsizei -> GLsizei -> GLenum -> GLenum -> ArrayBufferView -> Eff (webgl :: WebGl | eff) Unit

    renderbufferStorage_ :: forall eff. GLenum -> GLenum -> GLsizei -> GLsizei -> Eff (webgl :: WebGl | eff) Unit

    sampleCoverage_ :: forall eff. GLclampf -> GLboolean -> Eff (webgl :: WebGl | eff) Unit

    scissor_ :: forall eff. GLint -> GLint -> GLsizei -> GLsizei -> Eff (webgl :: WebGl | eff) Unit

    shaderSource_ :: forall eff. WebGLShader -> String -> Eff (webgl :: WebGl | eff) Unit

    stencilFuncSeparate_ :: forall eff. GLenum -> GLenum -> GLint -> GLuint -> Eff (webgl :: WebGl | eff) Unit

    stencilFunc_ :: forall eff. GLenum -> GLint -> GLuint -> Eff (webgl :: WebGl | eff) Unit

    stencilMaskSeparate_ :: forall eff. GLenum -> GLuint -> Eff (webgl :: WebGl | eff) Unit

    stencilMask_ :: forall eff. GLuint -> Eff (webgl :: WebGl | eff) Unit

    stencilOpSeparate_ :: forall eff. GLenum -> GLenum -> GLenum -> GLenum -> Eff (webgl :: WebGl | eff) Unit

    stencilOp_ :: forall eff. GLenum -> GLenum -> GLenum -> Eff (webgl :: WebGl | eff) Unit

    texImage2D_ :: forall eff. GLenum -> GLint -> GLenum -> GLsizei -> GLsizei -> GLint -> GLenum -> GLenum -> ArrayBufferView -> Eff (webgl :: WebGl | eff) Unit

    texParameterf_ :: forall eff. GLenum -> GLenum -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    texParameteri_ :: forall eff. GLenum -> GLenum -> GLint -> Eff (webgl :: WebGl | eff) Unit

    texSubImage2D_ :: forall eff. GLenum -> GLint -> GLint -> GLint -> GLsizei -> GLsizei -> GLenum -> GLenum -> ArrayBufferView -> Eff (webgl :: WebGl | eff) Unit

    uniform1f_ :: forall eff. WebGLUniformLocation -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    uniform1fv_ :: forall eff. WebGLUniformLocation -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    uniform1i_ :: forall eff. WebGLUniformLocation -> GLint -> Eff (webgl :: WebGl | eff) Unit

    uniform1iv_ :: forall eff. WebGLUniformLocation -> Int32Array -> Eff (webgl :: WebGl | eff) Unit

    uniform2f_ :: forall eff. WebGLUniformLocation -> GLfloat -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    uniform2fv_ :: forall eff. WebGLUniformLocation -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    uniform2i_ :: forall eff. WebGLUniformLocation -> GLint -> GLint -> Eff (webgl :: WebGl | eff) Unit

    uniform2iv_ :: forall eff. WebGLUniformLocation -> Int32Array -> Eff (webgl :: WebGl | eff) Unit

    uniform3f_ :: forall eff. WebGLUniformLocation -> GLfloat -> GLfloat -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    uniform3fv_ :: forall eff. WebGLUniformLocation -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    uniform3i_ :: forall eff. WebGLUniformLocation -> GLint -> GLint -> GLint -> Eff (webgl :: WebGl | eff) Unit

    uniform3iv_ :: forall eff. WebGLUniformLocation -> Int32Array -> Eff (webgl :: WebGl | eff) Unit

    uniform4f_ :: forall eff. WebGLUniformLocation -> GLfloat -> GLfloat -> GLfloat -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    uniform4fv_ :: forall eff. WebGLUniformLocation -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    uniform4i_ :: forall eff. WebGLUniformLocation -> GLint -> GLint -> GLint -> GLint -> Eff (webgl :: WebGl | eff) Unit

    uniform4iv_ :: forall eff. WebGLUniformLocation -> Int32Array -> Eff (webgl :: WebGl | eff) Unit

    uniformMatrix2fv_ :: forall eff. WebGLUniformLocation -> GLboolean -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    uniformMatrix3fv_ :: forall eff. WebGLUniformLocation -> GLboolean -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    uniformMatrix4fv_ :: forall eff. WebGLUniformLocation -> GLboolean -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    useProgram_ :: forall eff. WebGLProgram -> Eff (webgl :: WebGl | eff) Unit

    validateProgram_ :: forall eff. WebGLProgram -> Eff (webgl :: WebGl | eff) Unit

    vertexAttrib1f_ :: forall eff. GLuint -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    vertexAttrib1fv_ :: forall eff. GLuint -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    vertexAttrib2f_ :: forall eff. GLuint -> GLfloat -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    vertexAttrib2fv_ :: forall eff. GLuint -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    vertexAttrib3f_ :: forall eff. GLuint -> GLfloat -> GLfloat -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    vertexAttrib3fv_ :: forall eff. GLuint -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    vertexAttrib4f_ :: forall eff. GLuint -> GLfloat -> GLfloat -> GLfloat -> GLfloat -> Eff (webgl :: WebGl | eff) Unit

    vertexAttrib4fv_ :: forall eff. GLuint -> FloatArray -> Eff (webgl :: WebGl | eff) Unit

    vertexAttribPointer_ :: forall eff. GLuint -> GLint -> GLenum -> GLboolean -> GLsizei -> GLintptr -> Eff (webgl :: WebGl | eff) Unit

    viewport_ :: forall eff. GLint -> GLint -> GLsizei -> GLsizei -> Eff (webgl :: WebGl | eff) Unit


## Module Graphics.WebGLTexture

### Types

    data InternalFormat where
      IF_ALPHA :: InternalFormat
      IF_LUMINANCE :: InternalFormat
      IF_LUMINANCE_ALPHA :: InternalFormat
      IF_RGB :: InternalFormat
      IF_RGBA :: InternalFormat

    data SymbolicParameter where
      PACK_ALIGNMENT :: SymbolicParameter
      UNPACK_ALIGNMENT :: SymbolicParameter
      UNPACK_FLIP_Y_WEBGL :: SymbolicParameter
      UNPACK_PREMULTIPLY_ALPHA_WEBGL :: SymbolicParameter
      UNPACK_COLORSPACE_CONVERSION_WEBGL :: SymbolicParameter

    data TargetType where
      TEXTURE_2D :: TargetType
      TEXTURE_CUBE_MAP_POSITIVE_X :: TargetType
      TEXTURE_CUBE_MAP_NEGATIVE_X :: TargetType
      TEXTURE_CUBE_MAP_POSITIVE_Y :: TargetType
      TEXTURE_CUBE_MAP_NEGATIVE_Y :: TargetType
      TEXTURE_CUBE_MAP_POSITIVE_Z :: TargetType
      TEXTURE_CUBE_MAP_NEGATIVE_Z :: TargetType

    data TexFilterSpec where
      NEAREST :: TexFilterSpec
      LINEAR :: TexFilterSpec
      MIPMAP :: TexFilterSpec

    data TexParName where
      TEXTURE_MIN_FILTER :: TexParName
      TEXTURE_MAG_FILTER :: TexParName
      TEXTURE_WRAP_S :: TexParName
      TEXTURE_WRAP_T :: TexParName
      TEXTURE_MAX_ANISOTROPY_EXT :: TexParName

    data TexTarget where
      TTEXTURE_2D :: TexTarget
      TTEXTURE_CUBE_MAP :: TexTarget

    data TextureType where
      UNSIGNED_BYTE :: TextureType
      RGBA :: TextureType
      FLOAT :: TextureType
      UNSIGNED_SHORT_5_6_5 :: TextureType
      UNSIGNED_SHORT_4_4_4_4 :: TextureType
      UNSIGNED_SHORT_5_5_5_1 :: TextureType

    newtype WebGLTex where
      WebGLTex :: WebGLTexture -> WebGLTex


### Values

    activeTexture :: forall eff. Number -> Eff (webgl :: WebGl | eff) Unit

    bindTexture :: forall eff. TargetType -> WebGLTex -> EffWebGL eff Unit

    texture2DFor :: forall a eff. String -> TexFilterSpec -> (WebGLTex -> EffWebGL eff a) -> EffWebGL eff Unit

    withTexture2D :: forall eff typ. WebGLTex -> Number -> Uniform typ -> Number -> EffWebGL eff Unit