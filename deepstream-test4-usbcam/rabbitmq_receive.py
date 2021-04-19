#!/usr/bin/env python
import pika, sys, os

def main():
    
    credentials = pika.PlainCredentials('guest', 'guest')
    connect_param = pika.ConnectionParameters(
        host='localhost',
        credentials=credentials
    )
    connection = pika.BlockingConnection(connect_param)
    channel = connection.channel()
    # channel.queue_declare(queue='test')


    def callback(ch, method, properties, body):
        print(" [x] Received %r" % body.decode())

    channel.basic_consume(queue='test', on_message_callback=callback, auto_ack=True)

    print(' [*] Waiting for messages. To exit press CTRL+C')
    channel.start_consuming()

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)