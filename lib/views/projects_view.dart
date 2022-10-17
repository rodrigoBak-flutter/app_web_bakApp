import 'package:flutter/material.dart';
import 'package:app_porfolio_bakapp/utils/project_model.dart';
import 'package:app_porfolio_bakapp/utils/theme_selector.dart';
import 'package:app_porfolio_bakapp/utils/view_wrapper.dart';
import 'package:app_porfolio_bakapp/widgets/navigation_arrow.dart';
import 'package:app_porfolio_bakapp/widgets/project_entry.dart';
import 'package:app_porfolio_bakapp/widgets/project_image.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  late double screenWidth;
  late double screenHeight;
  int selectedIndex = 0;
  List<Project> projects = [
    Project(
      title: 'Hablame',
      imageURL: 'Hablame.png',
      description:
          'Háblame es una aplicación desarrollada por BakApp para ayudar a aquellas personas con dificultades a la hora de comunicarse: Sordera, parálisis cerebral, esclerosis lateral amiotrófica, entre muchas otras. Si tienes alguna de estas dificultades, descargando esta aplicación gratuita podrás comunicarte con todos a tu alrededor, ¡Al instante!',
    ),
    Project(
        title: 'Scanner',
        imageURL: 'Scanner.png',
        description:
            'Escáner de QR & Código de Barras / QR lector de código es extremadamente fácil de usar; simplemente apunte al QR o el código de barras que desea escanear y la aplicación automáticamente lo detectará y lo escaneará. El codigo QR quedara almacenado internamente en su dispositivo'),
    Project(
        title: 'Notas',
        imageURL: 'Notas.png',
        description:
            '¿Necesitas tomar una nota rápida para hacer una lista de la compra, un recordatorio de una dirección o una idea para empezar? Entonces no busques más ya que esta es la herramienta organizadora simple que has estado buscando : Organizador y planificador de listas de tareas. Lo mejor de las aplicaciones para tomar notas y notas adhesivas gratis para teléfonos móviles Android. No es necesario realizar complicados pasos de configuración, simplemente toca la pantalla y escribe lo que has venido a buscar y crear notas, listas rápidas, listas de comprobación o copias de seguridad para cualquier idea. ¡Con tu simple cuaderno personal podrás recordar cualquier cosa rápidamente! Lista de la compra para el supermercado, lista de tareas para tu agenda diaria y toma de notas más fácil para que organizar reuniones sea un paseo')
  ];

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('Hablame.png'), context);
    precacheImage(AssetImage('Scanner.png'), context);
    precacheImage(AssetImage('Notas.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ViewWrapper(
      desktopView: desktopView(),
      mobileView: mobileView(),
    );
  }

  Widget desktopView() {
    double space = MediaQuery.of(context).size.height * 0.03;
    List<Widget> images =
        List.generate((projects.length * 1.5).ceil(), (index) {
      if (index.isEven) {
        return ProjectImage(
            project: projects[index ~/ 2],
            onPressed: () => updateIndex(index ~/ 2));
      } else {
        return SizedBox(height: space);
      }
    });
    return Stack(
      children: [
        NavigationArrow(isBackArrow: true),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.05, horizontal: screenWidth * 0.1),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: images,
              ),
              SizedBox(width: space),
              Container(
                height: screenHeight * 0.2 * 2 + space * 2,
                child: Stack(
                  children: [
                    AnimatedAlign(
                      alignment: selectedIndex == 0
                          ? Alignment.topCenter
                          : selectedIndex == 1
                              ? Alignment.center
                              : Alignment.bottomCenter,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        color: Colors.white,
                        width: screenWidth * 0.05,
                        height: 3,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: space),
              Expanded(
                child: ProjectEntry(
                  project: projects[selectedIndex],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget mobileView() {
    List<Widget> projectList = List.generate(projects.length, (index) {
      return Column(
        children: [
          Text(
            projects[index].title,
            style: ThemeSelector.selectSubHeadline(context),
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            height: screenHeight * 0.1,
            width: screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                projects[index].imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            projects[index].description,
            style: ThemeSelector.selectBodyText(context),
          ),
          SizedBox(height: screenHeight * 0.1),
        ],
      );
    });
    return Column(children: projectList);
  }

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }
}
