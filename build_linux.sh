
#!/bin/sh

cd 3rdparty/zint-2.4.4/backend_qt4/
qmake
make clean
make

cd ../../../hybrid/
qmake
make clean
make

cd ../hybridpy

QTGUI_INC=/usr/lib64/qt4/include/QtGui
QTCORE_INC=/usr/lib64/qt4/include/QtCore
QTTYPESYSTEM=/usr/lib64/python3.4/site-packages/PySide/typesystems


shiboken ../data/global.h \
    --include-paths=../hybrid:$QTCORE_INC:$QTGUI_INC:/usr/include \
    --typesystem-paths=../data:$QTTYPESYSTEM \
    --output-directory=. \
    ../data/typesystem.xml

qmake
make clean
make

cd ..
cp -f libPyQtRPT.so.1.0.0 package/PyQtRPT.so
rm -rf libPyQtRPT.so.1.0.0
rm -rf libPyQtRPT.so.1.0
rm -rf libPyQtRPT.so.1
rm -rf libPyQtRPT.so

cp -f hybrid/libQtRPTaps.so.1.0.0 package/libQtRPTaps.so.1
cp -f hybrid/libQtZint.so package/libQtZint.so.1

cd package/

export LD_LIBRARY_PATH=.
