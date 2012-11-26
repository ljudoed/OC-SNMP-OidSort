#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <stdio.h>
#include <stdlib.h>

int cmp_oid (const char *sv1, const char *sv2)
{
	const char* s1 = sv2;
	const char* s2 = sv2;
	char* dot1 = (char*) s1;
	char* dot2 = (char*) s2;
	int i,n1,n2;
	for(; *s1 == *s2; ++s1, ++s2){
		if(*s1 == '.')
			dot1=(char*) s1+1;
		if(*s2 == '.')
			dot2=(char*) s2+1;
		if(!*s1)
			return 0;
	}
	if(!*s1)
		return -1;
	if(!*s2)
		return  1;
	for(n1=0, s1=dot1 ; (*s1) && (*s1 != '.') ; ++s1){
		n1=10*n1+(*s1-'0');
	}
	for(n2=0, s2=dot2; (*s2) && (*s2 != '.') ; ++s2){
		n2=10*n2+(*s2-'0');
	}
	return n1 < n2 ? -1 : 1;
}

int _cmp_oid (pTHX_ SV *sv1, SV *sv2)
{
	const char* s1 = SvPV_nolen(sv1);
	const char* s2 = SvPV_nolen(sv2);
	return cmp_oid(s1,s2);
}

void oid_sort(SV* data)
{
    size_t arrLen;
    AV* oids;

    if( !SvROK(data) )
        croak( "Requires an array ref ( type %d)\n", SvTYPE( data ));

    oids=(AV*)SvRV(data);
    arrLen=av_len(oids);
    sortsv(AvARRAY(oids),arrLen+1,(SVCOMPARE_t)_cmp_oid);
}


MODULE = OC::SNMP::OidSort		PACKAGE = OC::SNMP::OidSort		

PROTOTYPES: DISABLE


int
cmp_oid (s1, s2)
    char *  s1
    char *  s2

void
oid_sort (data)
    SV *    data
    PREINIT:
    I32* temp;
    PPCODE:
    temp = PL_markstack_ptr++;
    oid_sort(data);
    if (PL_markstack_ptr != temp) {
      /* truly void, because dXSARGS not invoked */
      PL_markstack_ptr = temp;
      XSRETURN_EMPTY; /* return empty stack */
    }
    /* must have used dXSARGS; list context implied */
    return; /* assume stack size is correct */

