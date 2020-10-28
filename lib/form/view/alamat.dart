part of 'form_page.dart';

class Alamat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          TextField(
            maxLines: 3,
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
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: Strings.RT_FORM_TEXT,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    onChanged: (value) {
                      context.bloc<FormCubit>().setRT(int.parse(value));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: const SizedBox(),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: Strings.RW_FORM_TEXT,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0))),
                    onChanged: (value) {
                      context.bloc<FormCubit>().setRw(int.parse(value));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
