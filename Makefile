install:
	install -T src/sophora-delete.sh $(DESTDIR)/usr/bin/sophora-delete
	install -T src/sophora-edit.sh $(DESTDIR)/usr/bin/sophora-edit
	install -T src/sophora-get-tkg.sh $(DESTDIR)/usr/bin/sophora-get-tkg
	install -T src/sophora-git-sync.sh $(DESTDIR)/usr/bin/sophora-git-sync
	install -T src/sophora-grub-update.sh $(DESTDIR)/usr/bin/sophora-grub-update
	install -T src/sophora-install.sh $(DESTDIR)/usr/bin/sophora-install
	install -T src/sophora-kernel-current.sh $(DESTDIR)/usr/bin/sophoraa-kernel-current
	install -T src/sophora-nvidia.sh $(DESTDIR)/usr/bin/sophora-nvidia
	install -T src/sophora-set-tkg.sh $(DESTDIR)/usr/bin/sophora-set-tkg
	install -T src/sophora-update-sleep.sh $(DESTDIR)/usr/bin/sophora-update-sleep
	install -T src/sophora-update.sh $(DESTDIR)/usr/bin/sophora-update
