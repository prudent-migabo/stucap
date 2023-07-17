
class AuthExceptionHandler {

  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case "email-already-in-use":
        errorMessage = "L'adresse e-mail fournie est déjà utilisée par un utilisateur existant";
        break;
      case "invalid-email":
        errorMessage = "La valeur fournie pour la propriété d'utilisateur de email n'est pas valide";
        break;
      case "invalid-email-verified":
        errorMessage = "La valeur fournie pour la propriété utilisateur emailVerified n'est pas valide";
        break;
      case "user-not-found":
        errorMessage = "Aucun enregistrement d'utilisateur existant ne correspond à l'identifiant fourni";
        break;
      case "operation-not-allowed":
        errorMessage = "Le fournisseur de connexion fourni est désactivé pour votre projet Firebase";
        break;
      case "session-cookie-revoked":
        errorMessage = "Le cookie de session Firebase a été révoqué";
        break;
      case "missing-uid":
        errorMessage = "Un identifiant uid est requis pour l'opération en cours";
        break;
      case "maximum-user-count-exceeded":
        errorMessage = "Le nombre maximum d'utilisateurs autorisés à importer a été dépassé";
        break;
      case "invalid-password":
        errorMessage = "La valeur fournie pour la propriété utilisateur du password de passe n'est pas valide";
        break;
      case "invalid-id-token":
        errorMessage = "Le jeton d'identification fourni n'est pas un jeton d'identification Firebase valide";
        break;
      case "internal-error":
        errorMessage = "Le serveur d'authentification a rencontré une erreur inattendue lors de la tentative de traitement de la demande.";
        break;
      case "wrong-password":
        errorMessage = "Le mot de passe fourni est incorrect";
        break;
      case "requires-recent-login":
        errorMessage = "Cette opération est sensible et nécessite une authentification récente. Connectez-vous à nouveau avant de réessayer cette demande.";
        break;
      case "id-token-expired":
        errorMessage = "Le jeton d'identification Firebase fourni a expiré";
        break;
      default:
        errorMessage = "Une erreur d'authentification est survenue";
    }
    return errorMessage;
  }

}

//wrong-password