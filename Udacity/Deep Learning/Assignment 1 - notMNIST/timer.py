import threading as t


class Timer:
    def __init__(self):
        self.running = True

    def setInterval(self, func, interval):
        def run():
            if self.running:
                func()
                t.Timer(interval=interval, function=run)
        t.Timer(interval=interval, function=run)

    def clearInterval(self):
        self.running = False
