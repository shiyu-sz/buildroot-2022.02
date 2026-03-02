
#include "mainwindow.h"
#include <QDebug>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    this->setAttribute(Qt::WA_AcceptTouchEvents);

    QLabel *label = new QLabel(this);
    label->setText("test");
    label->setGeometry(100, 300, 100, 50);

    button = new QPushButton(this);
    button->setText("test");
    button->setGeometry(200, 300, 100, 50);
    button->setStyleSheet("QPushButton { background-color: red; }");
    connect(button, SIGNAL(clicked()), this, SLOT(slots_button_clicked()));
}

MainWindow::~MainWindow()
{

}

void MainWindow::slots_button_clicked()
{
    static int bth_count = 0;
    bth_count ++;
    button->setText("test"+QString::number(bth_count));
}

bool MainWindow::event(QEvent *event) {
    if (event->type() == QEvent::TouchBegin || 
        event->type() == QEvent::TouchUpdate || 
        event->type() == QEvent::TouchEnd) 
    {
        QTouchEvent *touch = static_cast<QTouchEvent *>(event);
        const QList<QTouchEvent::TouchPoint> touchPoints = touch->touchPoints();
        
        for (const QTouchEvent::TouchPoint &point : touchPoints) {
            qDebug() << "ID:" << point.id() 
                     << "状态:" << point.state()
                     << "坐标:" << point.pos(); // 相对控件坐标
                     // << "全局坐标:" << point.screenPos(); 
        }
        return true;
    }
    return QWidget::event(event);
}