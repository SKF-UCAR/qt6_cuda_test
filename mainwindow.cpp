#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "dialog.h"
#include <QString>
#include <string>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    // Connect the button click signal to the slot
    // connect(ui->pushButton, &QPushButton::clicked, this, &MainWindow::on_pushButton_clicked);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    Dialog dialog(this);  // Create a dialog box
    QString s = detect_and_print().c_str();
    dialog.setLabelText(s);
    dialog.exec();        // Show the dialog box as a modal dialog
}
