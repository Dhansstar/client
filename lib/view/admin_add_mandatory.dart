part of 'view.dart';

class AdminAddMandatory extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Add Mandatory"),),
      body: _body(),
    );
  }

  Widget _body(){
    return ListView(
      children: [
        Text("Kategori"),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueAccent),
              color: Colors.white
          ),
          child: TextField(
            // controller: loginController.username,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        Text("Keterangan"),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueAccent),
              color: Colors.white
          ),
          child: TextField(
            // controller: loginController.username,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
            onPressed: (){},
            child: const Text("Add"),
          ),
        ),
      ],
    );
  }
}