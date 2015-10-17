class teacher(object):
    def __init__(self,name,deadline):
        self.__name = name
        self.__deadline = deadline

    def setName(self,name):
        self.__name = name

    def setDeadline(self,deadline):
        self._deadline = deadline
