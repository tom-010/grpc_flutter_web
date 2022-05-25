package main

import (
	"log"
	"net"

	"google.golang.org/grpc"
)

const (
	port = "0.0.0.0:9090"
)

// type UserManagementServer struct {
// 	pb.UnimplementedUserManagementServer
// }

// func (s *UserManagementServer) CreateNewUser(ctx context.Context, in *pb.NewUser) (*pb.User, error) {
// 	log.Printf("Received: %v", in.GetName())
// 	var user_id int32 = int32(rand.Intn(100000))
// 	return &pb.User{Name: in.GetName(), Age: in.GetAge(), Id: user_id}, nil
// }

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listn: %v", err)
	}

	s := grpc.NewServer()
	// pb.RegisterUserManagementServer(s, &UserManagementServer{})
	log.Printf("server listening at %v", lis.Addr())
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
