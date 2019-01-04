# Interfaxim

Ce projet fournit un fichier XSL (appelé `interfaxim.xsl`) qui transforme un fichier d'encodage de texte en XML en fac-similé interactif en HTML.

*[Read this in english][1]*

Pour que la transformation fonctionne, le fichier XML doit suivre rigoureusement les [directives TEI][2]. N'oubliez pas l'espace de nom dans le fichier XML : `<TEI xmlns="http://www.tei-c.org/ns/1.0">...</TEI>`.

## Pour commencer

Il y a 3 manières d'utiliser Interfaxim sur votre propre fichier d'encodage de texte :

### Option 1 : Utilisez un éditeur XML comme Oxygen

Tout d'abord, téléchargez l'archive Interfaxim en cliquant [ici][3] et extrayez le fichier nommé `interfaxim.xsl`. Ensuite, utilisez un éditeur de texte muni d'un processeur XSLT (comme **[Oxygen][4]**) pour transformer le fichier XML avec `interfaxim.xsl`. Cela génèrera un fichier HTML qui peut être ouvert sur presque n'importe quel navigateur et qui contient le fac-similé interactif du fichier XML.

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

Tout d'abord, téléchargez l'archive Interfaxim en cliquant [ici][3] et extrayez le fichier nommé `interfaxim.xsl`. Placez-le dans le même répertoire que votre fichier XML, puis ajoutez dans ce dernier la ligne suivante après la déclaration `<?xml ... ?>` :

    <?xml-stylesheet type="text/xsl" href="interfaxim.xsl"?>

Enfin, ouvrez le fichier XML sur un des navigateurs compatibles ([donnés plus bas][5]) et voilà !

**Avantages :** Vous pouvez créer des fac-similés interactifs sans connexion Internet.

**Inconvénients :** Vous ne pouvez utiliser cette méthode qu'avec un des navigateurs compatibles donnés dans la section **[Compatibilité des navigateurs][5]**.

## Compatibilité des navigateurs

Cette section ne vous concerne que si vous choisissez l'**[Option 2][7]** ou l'**[Option 3][8]**, mais pas si vous choississez l'**[Option 1][6]**.

:heavy_check_mark:: **Support complet** — :x:: **Pas supporté par défaut** — :grey_exclamation:: **Fonctionne mais avec des bugs d'affichage**

|       Firefox      | Chrome | Opera |  Internet Explorer |         Edge       |        Safari      |
|:------------------:|:------:|:-----:|:------------------:|:------------------:|:------------------:|
| :heavy_check_mark: |  :x:\* | :x:\* | :grey_exclamation: | :grey_exclamation: | :grey_exclamation: |

\* À cause de [problèmes de sécurité][9], Interfaxim ne marche pas par défaut sur les navigateurs de la famille Chromium (**Google Chrome**, **Chromium**, **Opera**, ...). Cependant, vous pouvez toujours faire fonctionner Interfaxim sur ces navigateurs en les lançant en mode `--allow-file-access-from-files` ([instructions ici][10]).

Vous pouvez nous prévenir d'autres soucis de compatibilité dans la section [Issues][11].

  [1]: README.md
  [2]: http://www.tei-c.org/release/doc/tei-p5-doc/en/html/
  [3]: https://github.com/TimotheAlbouy/Interfaxim/blob/master/interfaxim.zip?raw=true
  [4]: https://www.oxygenxml.com/
  [5]: #browser-compatibility
  [6]: #option-1-use-a-xml-editor-like-oxygen
  [7]: #option-2-on-web-browser-use-the-interfaxim-file-served-on-github
  [8]: #option-3-on-web-browser-download-interfaxim-locally
  [9]: https://blog.chromium.org/2008/12/security-in-depth-local-web-pages.html
  [10]: http://www.chrome-allow-file-access-from-file.com/
  [11]: https://github.com/TimotheAlbouy/Interfaxim/issues