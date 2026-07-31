#include "Sura.h"

#include <QApplication>
#include <QIcon>

int main(int argc, char* argv[])
{
  QApplication app(argc, argv);
  app.setApplicationName("sura");
  app.setDesktopFileName("sura");
  app.setWindowIcon(QIcon(":/images/icon.png"));

  Sura viewer;
  viewer.resize(1024, 768);
  viewer.show();

  return app.exec();
}
