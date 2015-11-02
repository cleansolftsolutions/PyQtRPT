# PyQtRPT
Python PySide Shiboken QtRPT 
Licence compatibles with QtRPT, zint

Instructions build:(tested in opensuse, python 3.4, PySide 1.2.2, Qt 4.8.6)

dowload qtRPTProject and copy 	
  CommonFiles
	QtRPT
	zint-2.4.4
	
final dir:
PyQtRPTDir/
  |-data/
  |	|-global.h
  |	|-typesystem.xml
  |-hybrid/
  |	|-hybrid.pro
  |-hybridpy/
  |	|-hybridpy.pro
  |-package/
  |	|-example1.py
  | |-example1.xml -> examples QtRPT
  |-CommonFiles/
  |-QtRPT/
  |-zint-2.4.4/
  |-build.sh
	

<<<<<<<<<<<<<<<
changue lines 41 y 42 the Zint.pro in /zint-2.4.4/backend_qt4
ej:
DLLDESTDIR = $${DEST_DIRECTORY}
DESTDIR    = $${DEST_DIRECTORY}/lib
to
DLLDESTDIR = ../../hybrid
DESTDIR    = ../../hybrid
<<<<<<<<<<<<<

in QtRPT/rptsql.h add:
#include <QImage>

<<<<<<<<<<<
in QtRPT/qtrpt.h comment:
line 93:
  //void setBackgroundImage(QPixmap image);

in QtRPT/qtrpt.cpp comment:
line 1728:
//void QtRPT::setBackgroundImage(QPixmap image) {
//    m_backgroundImage = &image;
//}

<<<<<<<<<<<<<<<<
<<<<<<<<<<<
in QtRPT/qtrpt.h
add in public:
    void setTableMap(QVariantList &vlist);
    void setParamMapOne(QVariant &mappo);
add in private:
    QVariantList m_vlist;
    QVariantMap m_mapParamOne;
    ------
in QtRPT/qtrpt.cpp:
add:
    void QtRPT::setTableMap(QVariantList &vlist){
      m_vlist = vlist;
    }
    void QtRPT::setParamMapOne(QVariant &mappo)
    {
	m_mapParamOne = mappo.toMap();
    }
in QtRPT/qtrpt.cpp:
add in QString QtRPT::sectionValue(QString paramName):
result:
    QVariant paramValue;
    paramName.replace("[","");
    paramName.replace("]","");
    //callbackFunc(recNo, paramName, paramValue);
    //if (paramValue.isNull())

    //if (!listOfGroup.isEmpty()) //group processing
    //    m_recNo = mg_recNo;

    emit setValue(m_recNo, paramName, paramValue, m_pageReport);
    if(!m_mapParamOne.contains(paramName)){
        paramValue = m_vlist.at(m_recNo).toMap().value(paramName);
    }else{
        paramValue = m_mapParamOne.value(paramName);
    }
    return paramValue.toString();

<<<<<<<<<<<<
<<<<<<<<<<<<<<<
in CommonFiles/Barcode.cpp changue:
line 11:
  QLibrary library("QtZint");
  to
  QLibrary library("../hybrid/libQtZint.so");
  
<<<<<<<<<<<<<<<<<<
in CommonFiles/CommonFiles_QtRpt.pri changue:
line 9:
LIBS += -L$${DEST_DIRECTORY}/lib -lQtZint
to
LIBS += ../hybrid/libQtZint.so

<<<<<<<<<<<<<<
config build.sh

QTGUI_INC=/usr/lib/qt4/include/QtGui
QTCORE_INC=/usr/lib/qt4/include/QtCore
QTTYPESYSTEM=/usr/lib/python3.4/site-packages/PySide/typesystems

<<<<<<<<<<<<<<
config hybridpy.pro

INCLUDEPATH +=  /usr/lib/python3.4/site-packages/PySide/include/PySide
INCLUDEPATH +=  /usr/lib/python3.4/site-packages/PySide/include/PySide/QtCore
INCLUDEPATH +=  /usr/lib/python3.4/site-packages/PySide/include/PySide/QtGui
INCLUDEPATH +=  /usr/lib/python3.4/site-packages/PySide/include/shiboken
INCLUDEPATH +=  /usr/include/python3.4m
	

LIBS += /usr/lib/libpython3.4m.so.1.0 \
    /usr/lib/python3.4/site-packages/PySide/libshiboken.cpython-34m.so.1.2 \
    /usr/lib/python3.4/site-packages/PySide/libpyside.cpython-34m.so.1.2 \
<<<<<<<<<<<<<

build:
sh build.sh

<<<<<<<<<<<<<<<
install libQtZint in /usr/lib:
ej: sudo cp -f hybrid/libQtZint.so.1.0.0 /usr/lib/libQtZint.so.1

<<<<<<<<<<<<<<<<
example:
python3 example1.py

<<<<<<<<<<<<<<<<
links:
http://www.qtrpt.tk/
http://lynxline.com/superhybrids-part-2-now-qt-pyside/
