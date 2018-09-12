package mock

import (
	"net"
	"time"

	"github.com/nemosupremo/vault-gatekeeper/scheduler"
)

var ValidTaskId = ""

type task struct {
	id        string
	name      string
	startTime time.Time
	ip        net.IP
	state     string
}

func (t task) Id() string {
	return t.id
}

func (t task) Group() string {
	return ""
}

func (t task) Image() string {
	return ""
}

func (t task) Name() string {
	return t.name
}

func (t task) IP() net.IP {
	return t.ip
}

func (t task) StartTime() time.Time {
	return t.startTime
}

func (t task) StartingState() bool {
	return t.state == "starting" || t.state == "staging"
}

type mockScheduler struct{}

func NewMockScheduler() (scheduler.Scheduler, error) {
	return &mockScheduler{}, nil
}

func (m *mockScheduler) LookupTask(taskId string) (scheduler.Task, error) {
	if taskId == ValidTaskId && len(ValidTaskId) > 0 {
		if taskId == "special" {
			return &task{
				id:        taskId,
				name:      "special",
				startTime: time.Now(),
			}, nil
		}
		if taskId == "localhost" {
			return &task{
				id:        taskId,
				name:      "special",
				startTime: time.Now(),
				ip:        net.IPv4(127, 0, 0, 1),
			}, nil
		}
		return &task{
			id:        taskId,
			name:      "mock-task",
			startTime: time.Now(),
		}, nil
	}
	if taskId == "expired" {
		return &task{
			id:        taskId,
			name:      "mock-task",
			startTime: time.Now().AddDate(-1, 0, 0),
		}, nil
	}
	if taskId == "starting" {
		return &task{
			id:        taskId,
			name:      "mock-task",
			startTime: time.Unix(0, 0),
			state:     "starting",
		}, nil
	}
	if taskId == "staging" {
		return &task{
			id:        taskId,
			name:      "mock-task",
			startTime: time.Unix(0, 0),
			state:     "staging",
		}, nil
	}
	return nil, scheduler.ErrTaskNotFound
}
