abstract class states{}
class initalstate extends states{}
class bottomnavigetor extends states{}
class getbusiness extends states{}
class getloadingbusiness extends states{}
class geterrorbusiness extends states{

  final error;
  geterrorbusiness(this.error);
}
class getsports extends states{}
class getloadingsports extends states{}
class geterrorsports extends states{

  final error;
  geterrorsports(this.error);
}
class getscience extends states{}
class getloadingscience extends states{}
class geterrorscience extends states{

  final error;
  geterrorscience(this.error);
}
class chancemodeapp extends states{}
class getsearch extends states{}
class getloadingsearch extends states{}
class geterrorsearch extends states{

  final error;
  geterrorsearch(this.error);
}