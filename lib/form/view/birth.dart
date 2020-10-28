part of 'form_page.dart';

class Birth extends StatelessWidget {
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
                hintText: Strings.TEMPAT_LAHIR_TEXTFORM,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) {
                context.bloc<FormCubit>().setPlaceBirth(value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: const SizedBox(),
          ),
          Expanded(child:
              BlocBuilder<FormCubit, FormInputState>(
                buildWhen: (prev, current) => prev.birthDate != current.birthDate,
                builder: (_, state) {
            return TextField(
              focusNode: FocusNode(canRequestFocus: false),
              controller: TextEditingController()..text = state.birthDate,
              decoration: InputDecoration(
                hintText: Strings.TANGGAL_LAHIR_FORM_TEXT,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onTap: () async {
                final datePick = await showDatePicker(
                    context: context,
                    initialDate: state.birthDate != null
                        ? DateTime.parse(state.birthDate)
                        : DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (_, child) {
                      return child;
                    });
                context.bloc<FormCubit>().setBirthDate(datePick.toIso8601String());
              },
            );
          }))
        ],
      ),
    );
  }
}
