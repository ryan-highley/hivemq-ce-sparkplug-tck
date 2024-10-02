ARG HIVEMQ_VERSION=2024.6

FROM hivemq/hivemq-ce:$HIVEMQ_VERSION

ARG SPARKPLUG_TCK_VERSION=3.0.0

USER 0

RUN set -x \
	&& apt-get update && apt-get install -y --no-install-recommends unzip \
	&& curl -fSL "https://download.eclipse.org/sparkplug/${SPARKPLUG_TCK_VERSION}/Eclipse-Sparkplug-TCK-${SPARKPLUG_TCK_VERSION}.zip" -o /opt/tck.zip \
	&& unzip -d /opt /opt/tck.zip \
	&& rm /opt/tck.zip \
	&& cp /opt/SparkplugTCK/hivemq-configuration/* /opt/hivemq/conf/ \
	&& unzip -d /opt/hivemq/extensions /opt/SparkplugTCK/hivemq-extension/sparkplug-tck-${SPARKPLUG_TCK_VERSION}.zip \
	&& rm -rf /var/lib/apt/lists/*

