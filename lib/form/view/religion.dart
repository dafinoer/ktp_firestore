part of 'form_page.dart';

class Religion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: Strings.RELIGION_FORM_TEXT,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: (value) {
          context.bloc<FormCubit>().setReligion(value);
        },
      ),
    );
  }
}
