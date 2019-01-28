import sys

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot

class Calculator(QObject):
    def __init__(self):
        QObject.__init__(self)

    moneyResult = pyqtSignal(float, arguments=['money'])
    percentResult = pyqtSignal(float, arguments=['percent'])

    @pyqtSlot(float, int, int)
    def money_def(self, okl_arg, day_arg, otr_arg):
        self.moneyResult.emit(round( (okl_arg/day_arg)*otr_arg, 2) ) 

    @pyqtSlot(float, int)
    def percent_def(self, money_def_result, percent_arg):
        if percent_arg > 0:
            self.percentResult.emit(round(money_def_result*(percent_arg/100), 2))
        else:
            self.percentResult.emit(0)

if __name__ == "__main__":
    sys.argv += ['--style', 'material']
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    calculator_object = Calculator()
    engine.rootContext().setContextProperty("calculator_qml", calculator_object)
    engine.load('ui.qml')

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())