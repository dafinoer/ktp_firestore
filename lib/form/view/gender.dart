part of 'form_page.dart';

class Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: Strings.GENDER_FORM_TEXT,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
              onChanged: (String value) {
                context.bloc<FormCubit>().setGender(value);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: Strings.BLOOD_GROUP_FORM_TEXT,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
                onChanged: (String value) {
                  context.bloc<FormCubit>().setGolonganDarah(value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
