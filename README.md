# Kerberos
## @edt ASIX M11-SAD Curs 2019-2020

Podeu trobar les imatges docker al Dockerhub de [jordiiqb](https://hub.docker.com/u/jordiiqb/)

Podeu trobar les imatges docker de classe al Dockerhub de [edtasixm11](https://hub.docker.com/u/edtasixm11/)

Podeu trobar la documentació del mòdul a [ASIX-M11](https://sites.google.com/site/asixm11edt/)

ASIX M11-ASO Escola del Treball de Barcelona


### Authenticació

**jordiiqb/k19:kserver** servidor kerberos detach. Crea els usuaris pere
  pau (admin), jordi, anna, marta, marta/admin i julia.
  Assignar-li el nom de host: *kserver.edt.org*

**jordiiqb/k19:khost** host client de kerberos. Simplement amb eines 
  kinit, klist i kdestroy (no pam). El servidor al que contacta s'ha 
  de dir *kserver.edt.org*.

**jordiiqb/k19:khostp** host amb PAM de  kerberos. El servidor al que contacta s'ha
  de dir *kserver.edt.org*. Aquest host configura el *system-auth* de pam per usar el
  mòdul *pam_krb5.so*.

**jordiiqb/k19:khostpl** (khost-pam-ldap) host amb PAM amb autenticació AP de  kerberos i IP de ldap.
  El servidor kerberos al que contacta s'ha de dir *kserver.edt.org*. El servidor ldap
  s'anomena ldap.edt.org. Aquest host es configura amb authconfig .

### Servei SSH Kerberitzat

**jordiiqb/k19:sshd** Servidor SSHD *kerberitzat*. Servidor ssh que permet
  l'accés d'usuaris locals i usuaris locals amb autenticació kerberos. El
  servidor s'ha de dir sshd.edt.org.

**jordiiqb/k19:sshdpl** (sshd-pam-kerberos-ldap) Servidor SSH  amb PAM amb autenticació AP de  kerberos i IP de ldap.
  El servidor kerberos al que contacta s'ha de dir *kserver.edt.org*. El servidor ldap
  s'anomena ldap.edt.org. Aquest host es configura amb authconfig . 
  S'ha generat partint del host edtasixm11/k19:khostpl i dse li ha afegit la part del servidor sshd.
  Conté els fitxers per poder activar el mount del home samba, però no s'ha configurat.

**jordiiqb/k19:sshdpls** (sshd-pam-kerberos-ldap-home-samba) Servidor SSH  amb PAM (kerberos+ldap)
  que munta els homes dels usuaris (dins del home) via samba.


#### Execució

Execució bàsica:
```
docker netweork create mynet
docker run --rm --name kserver.edt.org -h kserver.edt.org --net mynet -d jordiiqb/k19:kserver
docker run --rm --name sshd.edt.org    -h sshd.edt.org    --net mynet -d jordiiqb/k19:sshd
docker run --rm --name khost.edt.org -h khost.edt.org --net mynet -it jordiiqb/k19:khostp
```

Execució krb5+ldap:
```
docker netweork create mynet
docker run --rm --name ldap.edt.org -h ldap.edt.org --net mynet -d jordiiqb/ldapserver19:group
docker run --rm --name kserver.edt.org -h kserver.edt.org --net mynet -d jordiiqb/k19:kserver
docker run --rm --name khost.edt.org -h khost.edt.org --net mynet -it jordiiqb/k19:khostpl
```


### Teoria

**Autenticaction Provider AP**

Kerberos propoerciona el servei de proveïdor d'autenticació. No emmagatzema informació dels comptes d'usuari com
el uid, git, shell, etc. Simplement emmagatzema i gestiona els passwords dels usuaris, en entrades anomenades 
*principals* en la seva base de dades.

Coneixem els següents AP:

 * */etc/passwd* que conté els password (AP) i també la informació dels comptes d'usuari (IP).
 * *ldap* el servei de directori ldap conté informació dels comptes d'usuari (IP) i també els seus passwords (AP).
 * *kerberos* que únicament actua de AP i no de IP.

**Information Provider IP**

Els serveis que emmagatzemen la informació dels comptes d'usuari s'anomenen Information providers. Aquests
serveis proporcionen el uid, gid, shell, gecos, etc. Els clàssics són /etc/passwd i ldap.


### Model de pràctiques

El model que mantindrem a tot el mòsul ASIX M11-SAD és el següent:

 * **ldap** al servidor ldap tenim els usuaris habituals pere, marta, anna, julia, pau, jordi. El seu
  password és el seu propi nom.

 * **/etc/passwd** en els containers hi ha els usuaris locals local01, local02 i local03 que tenen assignat 
  com a passeord el seu mateix nom.

 * **kerberos + IP** els usuaris kuser01, kuser02 i kuser03 són principals de kerberos amb passwords tipus kuser01,
  kuser02 i kuser03. La informació del seu compte d'usuari és local al */etc/passwd* on **no** tenen password
  assignat.

 * **kerberos + ldap** Al servidor kerberos hi ha també principals per als usuaris usuals ldap pere, marta, anna, julia,
  jordi i pau. Els seus passwords són del tipus kpere, kmarta, kanna, kjulia, kjordi i kpau.

Es resum, podem verificar l'accés/autenticació d'usuaris locals usant el prototipus *local01*, podem fer test de la
connectivitat kerberos amb comptes locals amb usuaris tipus *kuser01*.  I finalment podem verificar l'autenticació
d'usuaris kerberos amb IP ldap amb els clàssics pere (kpere).



