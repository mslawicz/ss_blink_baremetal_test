set(SDK_PATH "C:/Users/ep14231/SimplicityStudio/SDKs/simplicity_sdk")
set(COPIED_SDK_PATH "simplicity_sdk_2024.6.0")

add_library(slc_blink_baremetal_test OBJECT
    "${SDK_PATH}/hardware/board/src/sl_board_control_gpio.c"
    "${SDK_PATH}/hardware/board/src/sl_board_init.c"
    "${SDK_PATH}/platform/common/src/sl_assert.c"
    "${SDK_PATH}/platform/common/src/sl_core_cortexm.c"
    "${SDK_PATH}/platform/common/src/sl_syscalls.c"
    "${SDK_PATH}/platform/Device/SiliconLabs/MGM24/Source/startup_mgm24.c"
    "${SDK_PATH}/platform/Device/SiliconLabs/MGM24/Source/system_mgm24.c"
    "${SDK_PATH}/platform/driver/leddrv/src/sl_led.c"
    "${SDK_PATH}/platform/driver/leddrv/src/sl_simple_led.c"
    "${SDK_PATH}/platform/emlib/src/em_burtc.c"
    "${SDK_PATH}/platform/emlib/src/em_cmu.c"
    "${SDK_PATH}/platform/emlib/src/em_core.c"
    "${SDK_PATH}/platform/emlib/src/em_emu.c"
    "${SDK_PATH}/platform/emlib/src/em_gpio.c"
    "${SDK_PATH}/platform/emlib/src/em_msc.c"
    "${SDK_PATH}/platform/emlib/src/em_prs.c"
    "${SDK_PATH}/platform/emlib/src/em_system.c"
    "${SDK_PATH}/platform/emlib/src/em_timer.c"
    "${SDK_PATH}/platform/peripheral/src/sl_hal_sysrtc.c"
    "${SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager.c"
    "${SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c"
    "${SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_init.c"
    "${SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c"
    "${SDK_PATH}/platform/service/device_init/src/sl_device_init_dcdc_s2.c"
    "${SDK_PATH}/platform/service/device_init/src/sl_device_init_emu_s2.c"
    "${SDK_PATH}/platform/service/device_manager/clocks/sl_device_clock_efr32xg24.c"
    "${SDK_PATH}/platform/service/device_manager/devices/sl_device_peripheral_hal_efr32xg24.c"
    "${SDK_PATH}/platform/service/device_manager/src/sl_device_clock.c"
    "${SDK_PATH}/platform/service/device_manager/src/sl_device_peripheral.c"
    "${SDK_PATH}/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c"
    "${SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager_region.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_burtc.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_sysrtc.c"
    "${SDK_PATH}/platform/service/sleeptimer/src/sl_sleeptimer_hal_timer.c"
    "${SDK_PATH}/platform/service/system/src/sl_system_init.c"
    "${SDK_PATH}/platform/service/system/src/sl_system_process_action.c"
    "../autogen/sl_board_default_init.c"
    "../autogen/sl_event_handler.c"
    "../autogen/sl_simple_led_instances.c"
)

target_include_directories(slc_blink_baremetal_test PUBLIC
   "../config"
   "../autogen"
   "../."
    "${SDK_PATH}/platform/Device/SiliconLabs/MGM24/Include"
    "${SDK_PATH}/platform/common/inc"
    "${SDK_PATH}/hardware/board/inc"
    "${SDK_PATH}/platform/service/clock_manager/inc"
    "${SDK_PATH}/platform/service/clock_manager/src"
    "${SDK_PATH}/platform/CMSIS/Core/Include"
    "${SDK_PATH}/platform/service/device_manager/inc"
    "${SDK_PATH}/platform/service/device_init/inc"
    "${SDK_PATH}/platform/emlib/inc"
    "${SDK_PATH}/platform/peripheral/inc"
    "${SDK_PATH}/platform/service/interrupt_manager/inc"
    "${SDK_PATH}/platform/service/interrupt_manager/inc/arm"
    "${SDK_PATH}/platform/driver/leddrv/inc"
    "${SDK_PATH}/platform/service/memory_manager/inc"
    "${SDK_PATH}/platform/common/toolchain/inc"
    "${SDK_PATH}/platform/service/system/inc"
    "${SDK_PATH}/platform/service/sleeptimer/inc"
)

target_compile_definitions(slc_blink_baremetal_test PUBLIC
    "DEBUG_EFM=1"
    "MGM240PB32VNA=1"
    "HARDWARE_BOARD_DEFAULT_RF_BAND_2400=1"
    "HARDWARE_BOARD_SUPPORTS_1_RF_BAND=1"
    "HARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1"
    "SL_BOARD_NAME=\"BRD2704A\""
    "SL_BOARD_REV=\"A00\""
    "SL_COMPONENT_CATALOG_PRESENT=1"
    "SL_CODE_COMPONENT_PERIPHERAL_SYSRTC=hal_sysrtc"
    "CMSIS_NVIC_VIRTUAL=1"
    "CMSIS_NVIC_VIRTUAL_HEADER_FILE=\"cmsis_nvic_virtual.h\""
    "SL_CODE_COMPONENT_CORE=core"
    "SL_CODE_COMPONENT_SLEEPTIMER=sleeptimer"
)

target_link_libraries(slc_blink_baremetal_test PUBLIC
    "-Wl,--start-group"
    "gcc"
    "c"
    "m"
    "nosys"
    "-Wl,--end-group"
)
target_compile_options(slc_blink_baremetal_test PUBLIC
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:C>:-mthumb>
    $<$<COMPILE_LANGUAGE:C>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:C>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-Os>
    $<$<COMPILE_LANGUAGE:C>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:C>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:C>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:C>:-mcmse>
    $<$<COMPILE_LANGUAGE:C>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:C>:-g>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:CXX>:-mthumb>
    $<$<COMPILE_LANGUAGE:CXX>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:CXX>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-Wall>
    $<$<COMPILE_LANGUAGE:CXX>:-Wextra>
    $<$<COMPILE_LANGUAGE:CXX>:-Os>
    $<$<COMPILE_LANGUAGE:CXX>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:CXX>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:CXX>:-mcmse>
    $<$<COMPILE_LANGUAGE:CXX>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:CXX>:-g>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:ASM>:-mthumb>
    $<$<COMPILE_LANGUAGE:ASM>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:ASM>:-mfloat-abi=hard>
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-imacros sl_gcc_preinclude.h>"
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-x assembler-with-cpp>"
)

set(post_build_command )
set_property(TARGET slc_blink_baremetal_test PROPERTY C_STANDARD 17)
set_property(TARGET slc_blink_baremetal_test PROPERTY CXX_STANDARD 17)
set_property(TARGET slc_blink_baremetal_test PROPERTY CXX_EXTENSIONS OFF)

target_link_options(slc_blink_baremetal_test INTERFACE
    -mcpu=cortex-m33
    -mthumb
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -T${CMAKE_CURRENT_LIST_DIR}/../autogen/linkerfile.ld
    --specs=nano.specs
    "SHELL:-Xlinker -Map=$<TARGET_FILE_DIR:blink_baremetal_test>/blink_baremetal_test.map"
    -Wl,--gc-sections
    -Wl,--no-warn-rwx-segments
)

# BEGIN_SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
