# docker image for macsec agent

DOCKER_MACSEC_STEM = docker-macsec
DOCKER_MACSEC = $(DOCKER_MACSEC_STEM).gz
DOCKER_MACSEC_DBG = $(DOCKER_MACSEC_STEM)-$(DBG_IMAGE_MARK).gz

$(DOCKER_MACSEC)_PATH = $(DOCKERS_PATH)/$(DOCKER_MACSEC_STEM)

$(DOCKER_MACSEC)_DEPENDS += $(SWSS) $(WPASUPPLICANT) $(REDIS_TOOLS) $(LIBNL3) $(LIBNL_GENL3) $(LIBNL_ROUTE3)
$(DOCKER_MACSEC)_DBG_DEPENDS = $($(DOCKER_CONFIG_ENGINE_BUSTER)_DBG_DEPENDS)
$(DOCKER_MACSEC)_DBG_DEPENDS += $(SWSS_DBG) $(LIBSWSSCOMMON_DBG)
$(DOCKER_MACSEC)_DBG_DEPENDS += $(WPASUPPLICANT_DBG)

$(DOCKER_MACSEC)_DBG_IMAGE_PACKAGES = $($(DOCKER_CONFIG_ENGINE_BUSTER)_DBG_IMAGE_PACKAGES)

$(DOCKER_MACSEC)_LOAD_DOCKERS += $(DOCKER_CONFIG_ENGINE_BUSTER)

SONIC_DOCKER_IMAGES += $(DOCKER_MACSEC)
SONIC_INSTALL_DOCKER_IMAGES += $(DOCKER_MACSEC)
SONIC_BUSTER_DOCKERS += $(DOCKER_MACSEC)

SONIC_DOCKER_DBG_IMAGES += $(DOCKER_MACSEC_DBG)
SONIC_INSTALL_DOCKER_DBG_IMAGES += $(DOCKER_MACSEC_DBG)
SONIC_BUSTER_DBG_DOCKERS += $(DOCKER_MACSEC_DBG)

$(DOCKER_MACSEC)_CONTAINER_NAME = macsec
$(DOCKER_MACSEC)_RUN_OPT += --privileged -t
$(DOCKER_MACSEC)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro
$(DOCKER_MACSEC)_RUN_OPT += -v /host/warmboot:/var/warmboot

# $(DOCKER_MACSEC)_BASE_IMAGE_FILES += macsecctl:/usr/bin/macsecctl
$(DOCKER_MACSEC)_FILES += $(SUPERVISOR_PROC_EXIT_LISTENER_SCRIPT)