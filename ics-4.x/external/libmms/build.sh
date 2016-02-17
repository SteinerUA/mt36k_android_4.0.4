export ANDROID_ROOT=/proj/mtk40532/data/p4_linux/DTV/DEV_BR/e_IDTV0801_LINUX_002119_2_ANDROID_DEV_BR/vm_linux/android/froyo-2.2
PATH=$ANDROID_ROOT/prebuilt/linux-x86/toolchain/arm-eabi-4.4.0/bin:$PATH
export PATH
GLIB_LIBS=glib.so
GLIB_CFLAGS='-DLIBDIR=\"$(libdir)\" -DHAVE_CONFIG_H -DG_LOG_DOMAIN=\"GLib-GRegex\" -DSUPPORT_UCP -DSUPPORT_UTF8 -DNEWLINE=-1 -DMATCH_LIMIT=10000000 -DMATCH_LIMIT_RECURSION=10000000 -DMAX_NAME_SIZE=32 -DMAX_NAME_COUNT=10000 -DMAX_DUPLENGTH=30000 -DLINK_SIZE=2 -DEBCDIC=0 -DPOSIX_MALLOC_THRESHOLD=10 -DG_DISABLE_DEPRECATED -DGLIB_COMPILATION'

export GLIB_LIBS
export GLIB_CFLAGS
./configure --host=x86-linux CC=arm-eabi-gcc LD=arm-eabi-ld AR=arm-eabi-ar CFLAGS="-L../../out/target/product/mt5396/obj/SHARED_LIBRARIES/glib_intermediates/LINKED -I../glib/glib -fno-exceptions -Wno-multichar -fPIC  -DANDROID -fmessage-length=0 -fno-strict-aliasing -Wno-unused -Winit-self -Wpointer-arith -Wpointer-arith -Wwrite-strings -Wunused -Winline -Wnested-externs -Wmissing-declarations -Wmissing-prototypes -Wno-long-long -Wfloat-equal -Wno-multichar -Wsign-compare -Wno-format-nonliteral -Wendif-labels -Wstrict-prototypes -Wdeclaration-after-statement -Wno-system-headers -nostdlib" 