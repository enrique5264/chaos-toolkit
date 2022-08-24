import os
from chaoslib.types import Configuration, Secrets, Experiment, Journal, Settings
from chaoslib.exceptions import InterruptExecution
from logzero import logger


def configure_control(configuration: Configuration = None,
                      secrets: Secrets = None, settings: Settings = None,
                      experiment: Experiment = None):
    CLUSTER = os.environ.get('CLUSTER')
    REGION = os.environ.get('REGION')
    try:
        if CLUSTER != None and CLUSTER != "" and REGION != None and REGION != "":
            command = "aws eks update-kubeconfig --region {0} --name {1}".format(
                REGION, CLUSTER)
            logger.info('Setting kubernetes context for cluster: ' + CLUSTER)
            output = os.popen(command).read()
            logger.info(output.strip())
        else:
            logger.info("No kubernetes context found: Context won't be set")
    except:
        raise InterruptExecution("Error while setting kubernetes context")


def after_experiment_control(context: Experiment, state: Journal,
                             configuration: Configuration = None,
                             secrets: Secrets = None, **kwargs):
    logger.info("Results Journal: " + str(state))
