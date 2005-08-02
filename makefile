# Make a release

PACKAGE = dp_evolution
VERSION = 1.1.3
EVTAR = evlink.tar.gz
EVZIP = evlink.zip
DISTTAR = $(PACKAGE)_$(VERSION).tar.gz
DISTZIP = $(PACKAGE)_$(subst .,_,$(VERSION)).zip

EVFILES = customer/dotproject/customer_lookup.php \
	customer/dotproject/d_create.php \
	customer/dotproject/create_customers.php \
	include/customer/class.dotproject.php \
	templates/en/customer/dotproject/report_form_fields.tpl.html \
	templates/en/customer/dotproject/customer_report.tpl.html \
	templates/en/customer/dotproject/customer_info.tpl.html \
	templates/en/customer/dotproject/quarantine.tpl.html \
	templates/en/customer/dotproject/customer_lookup.tpl.html

DISTFILES = addedit.php \
	calendar_tab.day_view.issues.php \
	configure.php \
	do_eventum_aed.php \
	do_eventum_supplvl_add.php \
	do_link.php \
	eventum.class.php \
	locales/en.inc \
	projects_tab.issues.php \
	README \
	redirect.php \
	setup.php \
	view_detail.php \
	vw_by_contract.php \
	vw_expired_contract.php \
	vw_no_contract.php

all: $(DISTTAR) $(DISTZIP)

$(DISTTAR):	$(EVTAR) $(EVZIP) $(DISTFILES)
	tar cvzf $(DISTTAR) $(EVTAR) $(EVZIP) $(DISTFILES)

$(DISTZIP):	$(EVTAR) $(EVZIP) $(DISTFILES)
	zip $(DISTZIP) $(EVTAR) $(EVZIP) $(DISTFILES)

$(EVTAR):	$(EVFILES:%=evlink/%)
	cd evlink; tar cvzf ../$(EVTAR) $(EVFILES)

$(EVZIP):	$(EVFILES:%=evlink/%)
	cd evlink; zip ../$(EVZIP) $(EVFILES)
