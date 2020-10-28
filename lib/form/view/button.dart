part of 'form_page.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormCubit, FormInputState>(
      buildWhen: (prev, current) => prev.isSubmit != current.isSubmit,
        builder: (_, FormInputState state) {
      return SizedBox(
        width: double.infinity,
        child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            onPressed: !state.isSubmit ? () async {
              await context.bloc<FormCubit>().submitButton();
              Navigator.pop(context);
            } : null,
            icon: Icon(Icons.add),
            label: Text(Strings.ADD_KTP_BUTTON)),
      );
    });
  }
}
