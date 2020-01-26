
class PetModel{

  String _nome;
  String _tipo;
  String _sexo;
  String _raca;
  String _cor;
  int _telefone;
  String _descricao;

  PetModel(this._nome,this._tipo,this._sexo,this._raca,this._cor,this._telefone,this._descricao);

  String getNome(){
    return this._nome;
  }

  String getTipo(){
    return this._tipo;
  }

  String getSexo(){
    return this._sexo;
  }

  String getRaca(){
    return this._raca;
  }

  String getCor(){
    return this._cor;
  }

  int getTelefone(){
    return this._telefone;
  }

  String getDescricao(){
    return this._descricao;
  }


}