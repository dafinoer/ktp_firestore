part of 'form_page.dart';



class Job extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: Strings.STATUS_PEKERJAAN_TEXT_FORM,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
        ),
        onChanged: (String value) {
          context.bloc<FormCubit>().setJob(value);
        },
      ),
    );
  }
}