from blcks import blcks
import json

@blcks
def main(event, context):
    """Entrypoint function

    blcks will parse event for necessary parameters,
    developers do not have to code here for now.
    """
    pass


@blcks.script("hellofunc")
def process(argv1=None, argv2=None):
    """handle your code logic here

    All the input arguments are passed thru api in payload
    You could extend input arguments by your own.

    :Example:

    >>> curl -v -L -XPOST \
    >>>      -d '{"action": "bulkreqheader", "cdnList": [], "argv2": 123}' \
    >>>      "https://yourdomain.com/api/faas/invocations"
    >>>
    """
    if argv1 == "Hello world":
        blcks.logger.info(
            "Hello world",
            inputParamsStr=json.dumps(
                {
                    "argv1": argv1,
                    "argv2": argv2
                }
            )
        )
    else:
        blcks.logger.error(
            "error"
        )

    pass