import 'dart:convert';


class Base64Util {
    // Convert to base 64 -> encode
    String convertToStringFromBase64(String document){
        Codec<String, String> convertBase64 = utf8.fuse(base64);
        return convertBase64.encode(document);
    }

    //Convert to String -> decode
     String convertToBase64FromString(String document){
        Codec<String, String> convertBase64 = utf8.fuse(base64);
        return convertBase64.decode(document);
    }
}