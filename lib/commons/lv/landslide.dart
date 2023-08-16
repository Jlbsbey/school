import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandslidePage extends StatefulWidget {
  @override
  State<LandslidePage> createState() => _LandslidePageState();
}

class _LandslidePageState extends State<LandslidePage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height * 0.06;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Nogruvums',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        actions: <Widget>[],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/earth.jpg'), fit: BoxFit.cover)),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(children: <Widget>[
          const ExpansionTile(
            title: Text(
              'Īsumā',
              style: TextStyle(fontSize: 20),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text('•Ja esat majās:'),
                  visualDensity: VisualDensity(vertical: -4),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: ListTile(
                  title: Text(
                      '•Ienesiet mājā visas mantas no pagalma vai balkona.'),
                  visualDensity: VisualDensity(vertical: -4),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: ListTile(
                  title: Text(
                      '•Izvāciet no mājas indīgas un viegli uzliesmojošas vielas.'),
                  visualDensity: VisualDensity(vertical: -4),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: ListTile(
                  title: Text('•Izslēdziet elektrību, gāzi un ūdeni.'),
                  visualDensity: VisualDensity(vertical: -4),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: ListTile(
                  title: Text(
                      '•Cieši aizveriet durvis, logus, ventilācijas atveres.'),
                  visualDensity: VisualDensity(vertical: -4),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text('•Ja esat ārpus mājas:'),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text(
                      '•Nepārvietojieties uz pretējo nogruvuma pusi, bet uz sāniem no tā.'),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('•Ziņojiet kaimiņiem par iespējamo nogruvumu.'),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text('•Steidzami aizejiet no nogruvuma līnijas.'),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            height: 1,
          ),
          ExpansionTile(
            title: Text(
              'Plašāk',
              style: TextStyle(fontSize: 20),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            initiallyExpanded: true,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 0),
                  child: Text(
                    "Ja esat majās:",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 8.0),
                child: Text(
                  "•Ienesiet mājā visas mantas no pagalma vai balkona. Ja ir iespēja, "
                  "iesaiņojiet lietas, kas var ciest no mitruma, polietilēnā.\n"
                  '•Aizvāciet no mājas indīgas un viegli uzliesmojošas vielas. '
                  'Tās var aprakt dārzā vai ievietot pagrabā. Arī pagraba ieeja rūpīgi jāaizver.\n'
                  '•Aizveriet elektrību, gāzi un ūdeni. Izraujiet elektroierīces no rozetēm. '
                  'Atvienojiet gāzes balonu, ja jums tāds ir.\n'
                  '•Cieši aizveriet durvis, logus, ventilācijas atveres. Tas nepieciešams, '
                  'lai netīrumi un ūdens straumes nenonāktu mājā.\n'
                  'Pēc tam dodieties uz organizētās evakuācijas vietu vai dodieties prom no '
                  'apdzīvotās vietas ar savu auto. Ja aizbraucat patstāvīgi, iepriekš uzziniet drošu '
                  'maršrutu, kā arī noskaidrojiet, kur atrast palīdzības punktu evakuētajiem. \n \n '
                  'Ja jūs ir pārņēmis zemes nogruvums un jūsu māja pārvietojas kopā ar augsni, uz kuras māja'
                  'stāv, ir jāiziet no telpas. Centieties turēties tuvāk gruvošā plača centram un pēc iespējas augstāk. '
                  'Netuvojieties malām.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
                  child: Text(
                    "Ja neesat majās:",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 8, top: 8),
                child: Text(
                  'Jūs varat dzirdēt lauku straumju troksni vai akmeņu dārdus, kad būsiet uz '
                  'savas apdzīvotās vietas ielas. Iespējams, nonāksiet kalnos — viens vai kopā ar grupu. '
                  'Šādos gadījumos nekavējoties jāatkāpjas no tuvojošās plūsmas gultnes.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 8, top: 8),
                child: Text(
                  '•Ciematā vai pilsētā pārvietojieties nevis uz pretējo pusi no gruvuma plūsmas, '
                  'bet uz sāniem. Drošas vietas būs kalnu nogāzes vai citas augstienes, kur nav '
                  'nogruvuma draudu. Pacentieties pēc iespējas ātrāk nokļūt tur.\n'
                  '•Ziņojiet kaimiņiem par tuvojošos nelaimi. Ja saceltās stihijas troksnis jūs '
                  'pārsteidzis ciema vai pilsētas ielā, informējiet par to visiem, kurus sastapsiet ceļā. '
                  'Iespējams, kāds par nogruvumu uzzinās no jums.\n'
                  '•Kalnos steidzami aizejiet no zemes nogruvuma līnijas. '
                  'Izmantojiet to pašu taktiku — virzieties uz sāniem un uz augšu. Ja esat zemienē, '
                  'nekavējoties kāpiet vairāk nekā 50-100 metru augstumā. Atcerieties, ka nogruvuma laikā '
                  'var lidot smagi akmeņi. Liels ātrums padara tos dzīvībai bīstamus, tāpēc '
                  'centieties darīt visu ātri. \n Nedrīkst slēpties ielejās un aizās.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
                  child: Text(
                    "Ko darīt, kad zemes nogruvums būs beidzies:",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 8, top: 8, bottom: h),
                child: Text(
                  'Ja esat steidzami glābies no stihijas un nokļuvis tuvākajā drošajā vietā, '
                  'pārliecinieties, ka draudu vairs nav. Pēc tam dodieties atpakaļ uz savu apdzīvoto vietu.\n'
                  'Kad jūsu sakari stradās, informējiet tuviniekus, ka ar jums viss ir kārtībā.\n'
                  'Pēc tam, ja jūtaties labi, palīdziet glābējiem. Varat pievienoties cietušo '
                  'meklēšanai un krāvumu izjaukšanai. Ja pats esat cietis, lūdziet palīdzību.\n'
                  'Neejiet mājas iekšā, kamēr to nav apskatījuši speciālisti. Tiem jāpārliecinās, vai '
                  'nesošās konstrukcijas ir drošā stāvoklī. Svarīgi pārbaudīt, lai mājoklī nebūtu gāzes noplūdes.'
                  ' Neieslēdziet elektrību, kamēr nesaņemsiet apstiprinājumu, ka tīkls ir darbojošā stāvoklī.\n'
                  'Turpiniet sekot līdzi informācijai no ārkārtas dienestiem.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.04,
              child: ElevatedButton.icon(
                onPressed: _scrollToTop,
                icon: Icon(Icons.arrow_upward),
                label: Text("Uz augšu"),
              ),
            ),
    );
  }
}
