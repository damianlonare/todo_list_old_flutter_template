part of 'signup_screen.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onSignUpButtonPressed() {
      BlocProvider.of<SignUpBloc>(context).add(
        SignUpButtonPressed(
          name: _nameController.text,
          surname: _surnameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text,
        ),
      );
    }

    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Form(
            child: Column(
              children: <Widget>[
                Spacer(),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre'),
                  controller: _nameController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Apellido'),
                  controller: _surnameController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: _emailController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  controller: _passwordController,
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  controller: _phoneController,
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed:
                  state is! SignUpLoading ? _onSignUpButtonPressed : null,
                  child: Text('Login'),
                ),
                Spacer(),
                Container(
                  child: state is SignUpLoading
                      ? CircularProgressIndicator()
                      : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
