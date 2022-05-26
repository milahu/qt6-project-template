#include <iostream> // std::cerr std::cout
#include <iomanip> // std::setw std::left

//#include <QDebug> // qDebug() << QString("hello");
#include <QLibraryInfo>

int main(int argc, char* argv[])
{

std::cout << "hello" << std::endl;

// this is needed to fix console output
// qt.conf is loaded on the first path() call
// but "PrefixPath = " is printed before the NIXOS_QT_CONF_DEBUG output
QLibraryInfo::path(QLibraryInfo::PrefixPath);



// print all qt.conf paths

#define P(K) std::cout << std::left << std::setw(22) << #K << " = " \
  << QLibraryInfo::path(QLibraryInfo::K).toStdString() << std::endl; // qt6: path

P(PrefixPath)
P(DocumentationPath)
P(HeadersPath)
P(LibrariesPath)
P(LibraryExecutablesPath)
P(BinariesPath)
P(PluginsPath)
P(QmlImportsPath)
P(ArchDataPath)
P(DataPath)
P(TranslationsPath)
P(ExamplesPath)
P(TestsPath)
P(SettingsPath) // not on windows

return 0;

}
