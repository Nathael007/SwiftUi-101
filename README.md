Exercice 2 :
Expliquez le changement que j’ai effectué par rapport à l’exemple précédent :
Vous avez ajouter une fonction pour ajouter des loot, et un foreach pour parcourir ces loot
Pourquoi utiliser un ForEach ? Quel est son rôle ? Et pourquoi séparer le bouton du ForEach ?
ForEach est utilisé pour créer des vues répétées basées sur une collection de données, tandis que la séparation du bouton vise à maintenir une distinction entre la description de l'interface utilisateur et le comportement de l'application dans SwiftUI.
Exercice 3 :
Testez ce code, fonctionne-t-il ? Pourquoi ?
Non, le code ne fonctionnne pas car il faut ajouter @State pour que SwiftUi soit informé des modifications de la variable.
Expliquez pourquoi maintenant cela fonctionne ?
Cela résout le problème lié à l'immutabilité de self dans la fonction addItem, car maintenant, loot est modifiable grâce à @State.

Exercice 1 :
Cliquez sur le bouton “Ajouter”, que se passe-t-il ? Pourquoi cela ne marche pas ?
Le bouton ne fonctionne pas, car le problème ici est que Inventory est une classe, et lorsqu'une instance de classe est utilisée dans une propriété @State, elle n'est pas automatiquement associée à la vue SwiftUI. 
Si vous ajoutez plusieurs items, que se passe-t-il dans la console XCode, vous devriez avoir un message d’erreur, expliquez pourquoi ?
Cela est dû au fait que la classe Inventory n'est pas conforme à ObservableObject et ne génère pas les notifications de mise à jour nécessaires pour informer la vue des changements.
Exercice 2 :
Pourquoi cela fonctionne de nouveau ?
L'utilisation de @StateObject, ObservableObject, et @Published permet à l'objet Inventory de devenir un objet observable dans SwiftUI.
Pourquoi utiliser @StateObject plutôt que @ObservedObject ou @State ?
@StateObject est utilisé pour la création et le partage d'une instance observable partagée entre plusieurs vues, tandis que @ObservedObject est utilisé pour observer une instance observable déjà créée. @State est utilisé pour gérer l'état local à une vue.
Il est donc approprié dans notre cas d'utiliser StateObject.