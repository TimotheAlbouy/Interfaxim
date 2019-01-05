# Interfaxim

Ce projet fournit un fichier XSL (appelé `interfaxim.xsl`) qui transforme un fichier XML d'encodage de texte en fac-similé interactif en HTML.

*[Read this in english][1]*

Pour que la transformation fonctionne, il est nécéssaire que l’élément racine `TEI` de votre fichier XML comprenne bien un attribut `xmlns` déclarant l’espace de nom comme suit : `<TEI xmlns="http://www.tei-c.org/ns/1.0">...</TEI>`.

La transformation du fichier XSL Interfaxim repose sur une structuration du fichier particulière :
L’image support du fac-similé doit être subdivisée en zones correspondant à chacun des segments de texte à transcrire. Les coordonnées de ces zones d’images doivent être encodées dans le XML de la manière suivante :
`<facsimile> 
      <surface> 
               <graphic url="___" width="___px" height="___px"/> 
               <zone xml:id="___" ulx="___" uly="___" lrx="___" lry="___"/>
      </surface> 
</facsimile>`

Les attributs de `graphic` doivent être renseignés par des valeurs comme ci-contre :
- `url` : le chemin du fichier image
- `width` : la largeur en pixels
- `height` : la hauteur en pixels

Les attributs de `zone` doivent être renseignés par des valeurs comme ci-contre :
- `xml:id` : l’identifiant que vous souhaitez associer à la zone
- `ulx` : la coordonnée d’abscisse pour le point en haut à gauche
- `uly` : la coordonnée d’ordonnée pour le point en haut à gauche
- `lrx` : la coordonnée d’abscisse pour le point en bas à droite
- `lry` : la coordonnée d’abscisse pour le point en bas à droite

Il est possible de générer automatiquement ces données grâce au [TEI zoner][2].

Au sein de la transcription du fac-similé dans le fichier XML, les zones de texte correspondant aux zones d'images préalablement définies dans la balise `facsimile` doivent être encapsulées dans des éléments `seg` avec pour attribut `facs` associé à la valeur d'identifiant définie pour la zone d'image correspondante. Par exemple, s'il existe une zone d'image comme suit :
`<zone xml:id="seg1" ulx="0" uly="0" lrx="500" lry="300">`

On pourra y associer un élément `seg` contenant la transcription correspondant comme suit :
`<seg facs="#seg1">TRANSCRIPTION</seg>`

## Pour commencer

Il y a 3 manières d'utiliser Interfaxim sur votre propre fichier d'encodage de texte :

### Option 1 : Utilisez un éditeur XML comme Oxygen

Tout d'abord, téléchargez l'archive Interfaxim en cliquant **[ici][3]** et extrayez le fichier nommé `interfaxim.xsl`. Ensuite, utilisez un éditeur de texte muni d'un processeur XSLT (comme **[Oxygen][4]**) pour transformer le fichier XML avec `interfaxim.xsl`. Cela génèrera un fichier HTML qui peut être ouvert sur presque n'importe quel navigateur et qui contient le fac-similé interactif du fichier XML.

**Avantages :** Vous pouvez utiliser presque n'importe quel navigateur web pour ouvrir le fichier HTML généré, contrairement aux 2 autres méthodes qui nécessitent un des navigateurs compatibles donnés dans la section **[Compatibilité des navigateurs][5]**. De plus, vous pouvez créer des fac-similés interactifs sans connexion Internet.

**Inconvénients :** Vous devez télécharger sur votre ordinateur un éditeur XML (comme **[Oxygen][4]** par exemple) si vous n'en avez pas déjà un.

### Option 2 : (Sur navigateur) Utilisez le fichier Interfaxim de GitHub

Ajoutez la balise suivante après la déclaration `<?xml ... ?>` dans votre fichier XML :

    <?xml-stylesheet
      type="text/xsl"
      href="https://raw.githubusercontent.com/TimotheAlbouy/Interfaxim/master/interfaxim.xsl"
    ?>

Enfin, ouvrez le fichier XML sur un des navigateurs compatibles ([donnés plus bas][5]) et voilà !

**Avantages :** Vous n'avez pas à télécharger quoi que ce soit et vous obtenez la dernière version d'Interfaxim automatiquement.

**Inconvénients :** Vous ne pouvez utiliser cette méthode qu'avec un des navigateurs compatibles donnés dans la section **[Compatibilité des navigateurs][5]**. De plus, cela nécessite une connexion Internet pour la première fois, mais cela pourrait ne pas être nécessaire pour les fois suivantes car le fichier XSL pourrait être déjà stocké dans le cache de votre navigateur.

### Option 3 : (Sur navigateur) Téléchargez Interfaxim localement

Tout d'abord, téléchargez l'archive Interfaxim en cliquant **[ici][3]** et extrayez le fichier nommé `interfaxim.xsl`. Placez-le dans le même répertoire que votre fichier XML, puis ajoutez dans ce dernier la ligne suivante après la déclaration `<?xml ... ?>` :

    <?xml-stylesheet type="text/xsl" href="interfaxim.xsl"?>

Enfin, ouvrez le fichier XML sur un des navigateurs compatibles ([donnés plus bas][5]) et voilà !

**Avantages :** Vous pouvez créer des fac-similés interactifs sans connexion Internet.

**Inconvénients :** Vous ne pouvez utiliser cette méthode qu'avec un des navigateurs compatibles donnés dans la section **[Compatibilité des navigateurs][5]**.

## Compatibilité des navigateurs

Cette section ne vous concerne que si vous choisissez l'**[Option 2][7]** ou l'**[Option 3][8]**, mais pas si vous choississez l'**[Option 1][6]**.

:heavy_check_mark:: **Support complet** — :x:: **Pas supporté par défaut**

|       Firefox      | Chrome | Opera |  Internet Explorer |         Edge       |        Safari      |
|:------------------:|:------:|:-----:|:------------------:|:------------------:|:------------------:|
| :heavy_check_mark: |  :x:\* | :x:\* | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |

\* À cause de [problèmes de sécurité][9], les navigateurs de la famille Chromium (**Google Chrome**, **Chromium**, **Opera**, ...) bloquent par défaut les transformations XSLT faites en local, ce qui rend Interfaxim inutilisable. Cependant, vous pouvez contourner cette limitation en lançant ces navigateurs en mode `--allow-file-access-from-files` ([instructions ici][10]).

Vous pouvez nous prévenir d'autres soucis de compatibilité dans la section [Issues][11].

  [1]: README.en.md
  [2]: http://teicat.huma-num.fr/zoner.php
  [3]: interfaxim.zip?raw=true
  [4]: https://www.oxygenxml.com/
  [5]: #compatibilité-des-navigateurs
  [6]: #option-1--utilisez-un-éditeur-xml-comme-oxygen
  [7]: #option-2--sur-navigateur-utilisez-le-fichier-interfaxim-de-github
  [8]: #option-3--sur-navigateur-téléchargez-interfaxim-localement
  [9]: https://blog.chromium.org/2008/12/security-in-depth-local-web-pages.html
  [10]: http://www.chrome-allow-file-access-from-file.com/
  [11]: https://github.com/TimotheAlbouy/Interfaxim/issues