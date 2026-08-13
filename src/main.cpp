#include "Sura.h"

#include <QApplication>
#include <QIcon>
#include <QPalette>
#include <QStringList>
#include <QStyleFactory>
#include <QStyleHints>

void applyTheme(QApplication& app)
{
  app.setStyle(QStyleFactory::create("Fusion"));

  if (QGuiApplication::styleHints()->colorScheme() == Qt::ColorScheme::Dark) {
    QPalette darkPalette;
    darkPalette.setColor(QPalette::Window, QColor(53, 53, 53));
    darkPalette.setColor(QPalette::WindowText, Qt::white);
    darkPalette.setColor(QPalette::Base, QColor(35, 35, 35));
    darkPalette.setColor(QPalette::AlternateBase, QColor(53, 53, 53));
    darkPalette.setColor(QPalette::ToolTipBase, Qt::white);
    darkPalette.setColor(QPalette::ToolTipText, Qt::white);
    darkPalette.setColor(QPalette::Text, Qt::white);
    darkPalette.setColor(QPalette::Button, QColor(53, 53, 53));
    darkPalette.setColor(QPalette::ButtonText, Qt::white);
    darkPalette.setColor(QPalette::BrightText, Qt::red);
    darkPalette.setColor(QPalette::Link, QColor(42, 130, 218));
    darkPalette.setColor(QPalette::Highlight, QColor(42, 130, 218));
    darkPalette.setColor(QPalette::HighlightedText, Qt::black);
    app.setPalette(darkPalette);
  }
  else {
    app.setPalette(app.style()->standardPalette());
  }
}

int main(int argc, char* argv[])
{
  QApplication app(argc, argv);
  app.setApplicationName("sura");
  app.setDesktopFileName("sura");
  app.setWindowIcon(QIcon(":/images/icon.png"));

  applyTheme(app);

  // Auto-update theme if user changes system setting while app is running
  QObject::connect(
    QGuiApplication::styleHints(), &QStyleHints::colorSchemeChanged, &app,
    [&app](Qt::ColorScheme) { applyTheme(app); }
  );

  Sura viewer;

  viewer.resize(1024, 768);
  viewer.show();

  if (app.arguments().size() > 1) {
    viewer.loadInitialFile(app.arguments().at(1));
  }

  return app.exec();
}
