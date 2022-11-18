project('nesting', 'cpp', default_options: [
  'default_library=both',
  # 'prefer_static=true',
  'cpp_std=c++20'
])

CXX = meson.get_compiler('cpp')

boost_dep = dependency('boost', modules: ['thread'])
freeglut_dep = dependency('glut')
gl_dep = dependency('gl')
glui_dep = CXX.find_library('glui')
glu_dep = dependency('glu')
cgal_dep = CXX.find_library('CGAL')
gmp_dep = dependency('gmp')
opencv_dep = dependency('opencv')
glew_dep = dependency('glew')


nesting_srcs = [
  'src/global.cpp',
  'src/algorithms.cpp',
  'src/loadFile.cpp',
  'src/imageProcessing.cpp',
  'src/Problem.cpp',
  'src/Picture.cpp',
  'src/OpenglCallbacks.cpp',
  'src/PreProcessing.cpp',
  'src/Piece.cpp',
  'src/main.cpp'
]

executable('nesting', nesting_srcs,
  install: true,
  dependencies: [
    boost_dep,
    freeglut_dep,
    gl_dep,
    glui_dep,
    glu_dep,
    cgal_dep,
    gmp_dep,
    opencv_dep,
    glew_dep
  ]  
)