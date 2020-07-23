{
  'targets': [
    {
      'target_name': 'InteropFramework',
      'mac_bundle': '1',
      'type': 'shared_library',
      'sources': [
        'SwiftClass.swift',
        'ObjCppClass.h',
        'ObjCppClass.mm',
        'InteropFramework.h'
      ],
      'mac_framework_headers': [
        'InteropFramework.h',
        'ObjCppClass.h'
      ],
      'defines': [ 'NAPI_DISABLE_CPP_EXCEPTIONS' ],
      "include_dirs" : [
          "<!(node -e \"require('nan')\")"
      ],
      'xcode_settings': {
        'DEFINES_MODULE': 'YES',
        'MACOSX_DEPLOYMENT_TARGET': '10.15',
        'SWIFT_OBJC_BRIDGING_HEADER': 'InteropFramework-Bridging-Header.h',
        'GCC_OPTIMIZATION_LEVEL': '0',
        'CLANG_ENABLE_MODULES': 'YES',
        'CLANG_ENABLE_OBJC_ARC': 'YES',
        'CLANG_MODULE_CACHE_PATH': '<(PRODUCT_DIR)/ModuleCache',
        'SWIFT_OPTIMIZATION_LEVEL': '-Onone',
        'LD_RUNPATH_SEARCH_PATHS': [
          '@loader_path/Frameworks'
        ],
      },
      'conditions': [
        ['"<(GENERATOR)"=="ninja"', {
          'include_dirs': [
            '<(INTERMEDIATE_DIR)',
          ],
        }],
      ]
    }
  ]
}