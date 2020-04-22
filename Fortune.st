'From Pharo8.0.0 of 22 January 2020 [Build information: Pharo-8.0.0+build.1124.sha.0932da82f08175e906b0e2a8052120c823374e9f (64 Bit)] on 22 April 2020 at 7:48:14.520519 am'!
Object subclass: #Fortune
	instanceVariableNames: ''
	classVariableNames: ''
	package: 'CAs-Fortune'!
"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Fortune class
	instanceVariableNames: ''!

!Fortune class methodsFor: 'class initialization' stamp: 'ChristerAssmundsson 4/22/2020 07:47'!
initialize
	(Teapot configure: {(#port -> 80)})
		GET: '/hi' -> 'Bonjour!';
		GET: '/' -> (Send message: #getFortune to: self);
		start ! !


!Fortune class methodsFor: 'action' stamp: 'ChristerAssmundsson 4/22/2020 07:47'!
getFortune
	| txt |
	txt := ZnClient new
		url: 'https://helloacm.com/api/fortune/';
		headerAt: 'User-Agent' put: 'Gecko';
		loggingOff;
		get.
	txt := txt allButFirst allButLast: 3. 
	txt := txt copyReplaceAll: '\n' with: String crlf.
	txt := txt copyReplaceAll: '\"' with: '"'.
	txt := txt copyReplaceAll: '\t' with: '        '.
	^ txt! !


Fortune initialize!
