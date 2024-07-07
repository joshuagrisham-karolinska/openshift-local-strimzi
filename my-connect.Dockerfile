FROM quay.io/strimzi/kafka:0.41.0-kafka-3.7.0
USER root:root

# get all "plugins" to their own path under /opt/kafka/plugins/
#COPY ./my-plugins/ /opt/kafka/plugins/


# e.g. /opt/kafka/plugins/redhatinsights-expandjsonsmt/

# - name: connect-file
# artifacts:
#   - type: maven
#     group: org.apache.kafka
#     artifact: connect-file
#     version: 3.7.0
# - name: connect-transforms
# artifacts:
#   - type: maven
#     group: org.apache.kafka
#     artifact: connect-transforms
#     version: 3.7.0
# - name: confluent-kafka-connect-jdbc
# artifacts:
#   - type: maven
#     repository: https://packages.confluent.io/maven
#     group: io.confluent
#     artifact: kafka-connect-jdbc
#     version: 10.7.4
# - name: redhatinsights-expandjsonsmt
# artifacts:
#   - type: tgz
#     url: https://github.com/RedHatInsights/expandjsonsmt/releases/download/0.0.7/kafka-connect-smt-expandjsonsmt-0.0.7.tar.gz
#     sha512sum: 2dc2ab76a9c41200c022c34698bc345b933e53737bdc53f345b0f84232a5e4693a879b40bf14e3f74064ccfdfbf03703dea9a18b55803f059a704808543da4c4
# - name: kryptonite-transform
# artifacts:
#   - type: zip
#     url: https://github.com/hpgrahsl/kryptonite-for-kafka/releases/download/v0.4.2/connect-transform-kryptonite-0.4.2.zip
#     sha512sum: 1b693752f576ee67f12d7a2f51e0bcd0e9ec73dbabed6beab43d7f693433412e7056de077743eba0128ec76084d20e59d1ecbb249e11120e578f8a113bb3eab8
# 

USER 1001
