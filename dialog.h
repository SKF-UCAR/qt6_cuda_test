#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>

std::string detect_and_print();

namespace Ui {
class Dialog;
}

class Dialog : public QDialog
{
    Q_OBJECT

public:
    explicit Dialog(QWidget *parent = nullptr);
    ~Dialog();

    // Public method to set label text
    void setLabelText(const QString &text);
private:
    Ui::Dialog *ui;
};


#endif // DIALOG_H
