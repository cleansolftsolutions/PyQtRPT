TEMPLATE = lib
QT += core gui sql
 
INCLUDEPATH += hybrid
INCLUDEPATH += ../hybrid
include(../QtRPT/QtRPT.pri)

INCLUDEPATH +=  /usr/lib64/python3.4/site-packages/PySide/include/PySide
INCLUDEPATH +=  /usr/lib64/python3.4/site-packages/PySide/include/PySide/QtCore
INCLUDEPATH +=  /usr/lib64/python3.4/site-packages/PySide/include/PySide/QtGui
INCLUDEPATH +=  /usr/lib64/python3.4/site-packages/PySide/include/shiboken
INCLUDEPATH +=  /usr/include/python3.4m
	

LIBS += /usr/lib64/libpython3.4m.so.1.0 \
    /usr/lib64/python3.4/site-packages/PySide/libshiboken.cpython-34m.so.1.2 \
    /usr/lib64/python3.4/site-packages/PySide/libpyside.cpython-34m.so.1.2 \
    ../hybrid/libQtRPTaps.so \ # adaptation pyside
    ../hybrid/libQtZint.so
 
TARGET = ../PyQtRPT
 
SOURCES += \
    PyQtRPT/pyqtrpt_module_wrapper.cpp \
    PyQtRPT/qtrpt_wrapper.cpp \
    PyQtRPT/dataobject_wrapper.cpp \
    PyQtRPT/rptbandobject_wrapper.cpp \
    PyQtRPT/rptfieldobject_wrapper.cpp \
    PyQtRPT/rptpageobject_wrapper.cpp \
    PyQtRPT/rptsql_wrapper.cpp \
    PyQtRPT/rptsqlconnection_wrapper.cpp \
    PyQtRPT/qtrptname_wrapper.cpp \
    PyQtRPT/barcode_wrapper.cpp \
    PyQtRPT/chart_wrapper.cpp \
    PyQtRPT/graphparam_wrapper.cpp \
    PyQtRPT/aggregatevalues_wrapper.cpp\
    PyQtRPT/rpttabelement_wrapper.cpp \
    PyQtRPT/rptcrosstabobject_wrapper.cpp



