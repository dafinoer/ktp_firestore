part of 'form_page.dart';


class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormCubit, FormInputState>(
      buildWhen: (prev, curr) => prev.name != curr.name,
      builder: (_, state){
        return TextField(
          decoration: InputDecoration(
            hintText: 'Name',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0)
            ),
          ),
          onChanged: (value){
            context.bloc<FormCubit>().setName(value);
          },
        );
    });
  }
}