package converter is
   function boldify(S: String;found:Boolean:=False) return String;
   function italicise(S: String;found:Boolean:=False) return String;
   function linkify(S: String) return String;
end converter;
