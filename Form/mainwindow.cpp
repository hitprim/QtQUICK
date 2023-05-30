#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QPropertyAnimation>
#include <QSequentialAnimationGroup>
#include <QGraphicsOpacityEffect>
#include <QParallelAnimationGroup>
#include <QPalette>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}



void MainWindow::animateShakeWindow()
{
    QPropertyAnimation *animation = new QPropertyAnimation(this, "pos");
    animation->setDuration(100);
    animation->setKeyValueAt(0, pos());
    animation->setKeyValueAt(0.1, pos() + QPoint(5, 0));
    animation->setKeyValueAt(0.2, pos() + QPoint(-5, 0));
    animation->setKeyValueAt(0.3, pos() + QPoint(5, 0));
    animation->setKeyValueAt(0.4, pos() + QPoint(-5, 0));
    animation->setKeyValueAt(0.5, pos() + QPoint(5, 0));
    animation->setKeyValueAt(0.6, pos() + QPoint(-5, 0));
    animation->setKeyValueAt(0.7, pos() + QPoint(5, 0));
    animation->setKeyValueAt(0.8, pos() + QPoint(-5, 0));
    animation->setKeyValueAt(0.9, pos() + QPoint(5, 0));
    animation->setKeyValueAt(1, pos());
    animation->setEasingCurve(QEasingCurve::InOutQuad);

    animation->start(QAbstractAnimation::DeleteWhenStopped);
}

void MainWindow::animateColorChangeSuccess(){
    QGraphicsOpacityEffect *effect = new QGraphicsOpacityEffect(this);
        ui->centralwidget->setGraphicsEffect(effect);

        QPropertyAnimation *animation = new QPropertyAnimation(effect, "opacity");
        animation->setDuration(500);
        animation->setStartValue(1.0);
        animation->setEndValue(0.0);
        animation->start(QAbstractAnimation::DeleteWhenStopped);

}

void MainWindow::animateColorChangeFailed()
{
    QGraphicsOpacityEffect *effect = new QGraphicsOpacityEffect(this);
        ui->lineEdit_login->setGraphicsEffect(effect);
        ui->lineEdit_password->setGraphicsEffect(effect);
        ui->centralwidget->setGraphicsEffect(effect);

        QPropertyAnimation *animation = new QPropertyAnimation(effect, "opacity");
        animation->setDuration(500);
        animation->setStartValue(1.0);
        animation->setEndValue(0.0);
        animation->start(QAbstractAnimation::DeleteWhenStopped);

        ui->lineEdit_login->setStyleSheet("QLineEdit { background-color: red; }");
        ui->lineEdit_password->setStyleSheet("QLineEdit { background-color: red; }");

        connect(animation, &QPropertyAnimation::finished, this, [this]() {
            ui->centralwidget->setGraphicsEffect(nullptr);
            ui->lineEdit_login->setStyleSheet("QLineEdit { background-color: white; }");
            ui->lineEdit_password->setStyleSheet("QLineEdit { background-color: white; }");
        });


}

void MainWindow::on_pushButton_clicked()
{
    if (ui->lineEdit_login->text() == "login" && ui->lineEdit_password->text() == "password") {
        qDebug() << "Success";

        animateColorChangeSuccess();

    } else {
        qDebug() << "Wrong login or password";

        animateShakeWindow();
        animateColorChangeFailed();
    }
}

