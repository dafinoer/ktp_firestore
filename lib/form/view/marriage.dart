part of 'form_page.dart';


class Marriage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: Strings.CITIZENSHIP_FORM_TEXT,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          )
        ),
        onChanged: (String value) {
          context.bloc<FormCubit>().setStatusKawin(value);
        },
      ),
    );
  }
}