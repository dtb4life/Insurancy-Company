import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  List<InsuranceContract> insuranceContracts = [
    InsuranceContract(
      title: 'Автострахование',
      description: 'Автострахование – это надежный способ избежать финансовых потерь при угоне, повреждении автомобиля и причинении вреда имуществу и здоровью третьих лиц. Автострахование – это необходимость для каждого владельца транспортного средства.  Список необходимых документов: Если вы оформляете полис автострахования впервые, то нужно подготовить следующий комплект документов и предоставить его страховой компании: паспорт лица, собирающегося заключить договор страхования (страхователя); водительское удостоверение, либо временное удостоверение на право управления ТС лиц, допущенных к управлению;для юр. лица: свидетельство о регистрации юридического лица, выданное уполномоченными органами; для физ. лица – индивидуального предпринимателя: соответствующее свидетельство о регистрации физического лица в качестве ИП;паспорт ТС, свидетельство о его регистрации; договор аренды ТС или другие документы, которые дают возможность подтвердить интерес страхователя в сохранении ТС в ситуации, когда необходимо заключить договор страхования не в пользу собственника автомобиля; договор купли-продажи или справку-счет, который подтверждает стоимость транспортного средства, факт приобретения ТС и различного доп. оборудования (если оно имеется), а также документы, подтверждающие его установку; если ТС было приобретено в кредит или же находится под залогом, нужен соответствующий договор (кредитный, залога); документы, которые подтверждают покупку и установку различных защитных устройств и систем (например, сигнализации), и/или договор на установку и обслуживание радиопоисковой/спутниковой системы (при условии, что они установлены на автомобиле); диагностическая карта (в случае необходимости).Если необходимо продление действия полиса (пролонгация), нужно подготовить следующий пакет документов:паспорт лица, заключившего договор страхования (страхователя); водительское удостоверение, либо временное удостоверение на право управления ТС лиц, допущенных к управлению;паспорт ТС, свидетельство о его регистрации; договор аренды ТС или другие документы, которые подтверждают интерес страхователя в сохранении ТС в ситуации, когда необходимо заключить договор страхования не в пользу собственника автомобиля.Если копии документов уже имеются в страховой компании, то повторно их подавать не надо. Исключения: оригинал паспорта того человека, который заключил договор (страхователя), свидетельство о регистрации юр. лица/физ. лица в качестве ИП. Если продлевается полис КАСКО при неизменных условиях страхования, то на стоимость влияют такие факторы, как наличие страховых случаев по предыдущему полису и их количество. ',
    ),
    InsuranceContract(
      title: 'Страхование здоровья и жизни',
      description: 'Страхование здоровья представляет собой вид защиты, который помогает покрыть медицинские расходы, связанные с лечением заболеваний и травм. Существуют различные типы страхования здоровья, включая индивидуальное, групповое и семейное страхование. Также может быть установлено ограничение по количеству посещений врачей или типам услуг, которые могут быть покрыты. Список необходимых документов: Паспорт гражданина РФили иного государства; Медицинская справка, подтверждающая отсутствие хронических заболеваний и противопоказаний для страхования здоровья. Заполненная медицинская анкета. Справка о доходах за последний год или за период, указанный в условиях страхования. Справка о наличии или отсутствии других действующих страховых полисов. Договор о назначении наследника в случае смерти застрахованного лица (для страхования жизни). Документы, подтверждающие наличие имущества и его стоимость, в случае страхования жизни на случай инвалидности. ',
    ),
    InsuranceContract(
      title: 'Страхование путешественников',
      description: 'Страховка за границей может понадобиться в самый неожиданный момент: после дегустации экзотической кухни, покорения новых вершин или встречи с дикой природой. Не волнуйтесь, вам не придется искать помощь в чужой стране. Наша компания возьмет на себя заботу о вас. При возникновении непредвиденных ситуаций страховка покроет ваши расходы на: амбулаторное или стационарное лечение неожиданных заболеваний или травм; оказание экстренной стоматологической помощи; эвакуацию с места происшествия в ближайшее медицинское учреждение или к врачу, а также транспортировку из одной клиники в другую; проезд и размещение близкого родственника в случае госпитализации; возвращение несовершеннолетних детей, оставшихся без присмотра; вынужденное проживание в гостинице после стационарного лечения или из-за карантина; медицинскую и посмертную репатриацию. Сумма, на которую вы будете застрахованы: 35 000 — 100 000 €',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: insuranceContracts.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpansionTile(
          title: Text(insuranceContracts[index].title),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Text(insuranceContracts[index].description),
                  ElevatedButton(
                    onPressed: () {
                      InsuranceRequest request = InsuranceRequest();
              
                    },
                    child: Text('Отправить заявку'),
                  ),
                ],
              ),
            ),
          ],
          trailing: Icon(Icons.arrow_drop_down),
        );
      },
    );
  }
}

class InsuranceRequest {

  // Заявка на страховку
}

class InsuranceContract {
  final String title;
  final String description;

  InsuranceContract({
    required this.title,
    required this.description,
  });
}