#include "window.hh"
#include <QApplication>

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);

    Tester test;
    test.show();

    app.exec();
}
