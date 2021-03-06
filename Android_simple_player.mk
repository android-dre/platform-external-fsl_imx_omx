
include $(CLEAR_VARS)
FSL_OMX_CFLAGS += -DANDROID_BUILD -D_POSIX_SOURCE -UDOMX_MEM_CHECK -Wno-unused-parameter -Werror

FSL_OMX_LDFLAGS := -Wl,--fatal-warnings

FSL_OMX_INCLUDES := \
	$(LOCAL_PATH)/OSAL/ghdr \
	$(LOCAL_PATH)/utils \
	$(LOCAL_PATH)/utils/audio_frame_parser \
	$(LOCAL_PATH)/OpenMAXIL/ghdr \
	$(LOCAL_PATH)/OpenMAXIL/src/core_mgr \
	$(LOCAL_PATH)/OpenMAXIL/src/core \
	$(LOCAL_PATH)/OpenMAXIL/src/content_pipe \
	$(LOCAL_PATH)/OpenMAXIL/src/component/common \
	$(LOCAL_PATH)/../../frameworks/av/include/media \
	$(LOCAL_PATH)/../../frameworks/native/include/media/hardware \
	$(LOCAL_PATH)/../../device/fsl-codec/ghdr \
	$(LOCAL_PATH)/../../device/fsl-codec/ghdr/common

FSL_OMX_CFLAGS += -UDOMX_STEREO_OUTPUT


ifeq ($(TARGET_BOARD_PLATFORM), imx6)
	FSL_OMX_INCLUDES += $(LOCAL_PATH)/../../hardware/imx/display/gralloc_v2
	FSL_OMX_CFLAGS += -DMX6X
endif
ifeq ($(TARGET_BOARD_PLATFORM), imx7)
	FSL_OMX_INCLUDES += $(LOCAL_PATH)/../../hardware/imx/display/gralloc_v2
	FSL_OMX_CFLAGS += -DMX7X
endif
ifeq ($(TARGET_BOARD_PLATFORM), imx8)
    FSL_OMX_INCLUDES += $(LOCAL_PATH)/../../hardware/imx/display/gralloc_v2
    FSL_OMX_CFLAGS += -DMX8X
endif

include $(FSL_OMX_PATH)/utils/id3_parser/Android.mk
include $(FSL_OMX_PATH)/OSAL/linux/Android.mk
include $(FSL_OMX_PATH)/utils/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/resource_mgr/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/core_mgr/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/core/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/content_pipe/local_file_pipe/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/content_pipe/shared_fd_pipe/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/common/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/clock/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/fsl_parser/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/mp3_parser/Android.mk

include $(FSL_OMX_PATH)/OpenMAXIL/src/component/amr_dec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/flac_dec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/pcm_dec/Android.mk

ifneq ($(TARGET_BOARD_PLATFORM), imx8)
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/audio_processor/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/android_audio_render/Android.mk
endif

include $(FSL_OMX_PATH)/OpenMAXIL/src/component/sorenson_dec/Android.mk

ifeq ($(BOARD_HAVE_VPU),true)
FSL_OMX_INCLUDES += $(FSL_OMX_PATH)/../linux-lib/ipu \
                    $(FSL_OMX_PATH)/../linux-lib/vpu
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/vpu_wrapper/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/vpu_dec_v2/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/vpu_enc/Android.mk
endif


include $(FSL_OMX_PATH)/stagefright/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/client/Android.mk
include $(FSL_OMX_PATH)/Android/Android_simple_player.mk
include $(FSL_OMX_PATH)/OpenMAXIL/release/registry/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/wmv_dec/Android.mk
#include $(FSL_OMX_PATH)/OpenMAXIL/src/component/libav_video_dec/Android.mk
#include $(FSL_OMX_PATH)/OpenMAXIL/src/component/libav_audio_dec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/surface_render/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/soft_hevc_dec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/mp3_udec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/aac_udec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/wma_udec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/vorbis_udec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/ac3_udec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/ec3_udec/Android.mk
include $(FSL_OMX_PATH)/OpenMAXIL/src/component/realaudio_udec/Android.mk

include $(FSL_OMX_PATH)/CactusPlayer/Android.mk

